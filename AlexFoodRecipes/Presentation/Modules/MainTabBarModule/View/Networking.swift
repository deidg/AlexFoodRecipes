//
//  Networking.swift
//  AlexFoodRecipes
//
//  Created by Alex on 14.09.2024.
//

import Foundation
import Alamofire

final class Networking: NetworkingProtocol {
    func sendRequest<Response: Codable>(endPointItem: EndPointType, handler: Command<Response?>) {
        guard let request = createUrlRequestWith(endPointItem) else {
            handler.perform(with: nil)
            return
        }
        
        AF.request(request)
            .validate(statusCode: 200...299)
            .responseData { [weak self] (response) in
                self?.proceedResult(endPoint: endPointItem, response: response, handler: { res in
                    DispatchQueue.main.async {
                        handler.perform(with: res)
                    }
                })
            }
    }
    
    private func proceedResult<Response: Codable>(endPoint: EndPointType, response: Alamofire.DataResponse<Data, AFError>, handler: @escaping (Response?) -> Void) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self else { return }
            let result = response.result
            var final: Response?
            switch result {
            case .success(let data):
                if Response.self == DataResponse.self, let object = DataResponse(data: data) as? Response {
                    final = object
                } else {
                    do {
                        let wrapper = try JSONDecoder().decode(Response.self, from: data)
                        final = wrapper
                    } catch {
                        print("DECODING POSHEL PO PIZDE")
                        final = nil
                    }
                }
            case .failure(let error):
                //TODO: Error handling
                final = nil
            }
            handler(final)
        }
    }
    
    func cancelAllTasksNetworkingAF() {
        AF.session.getAllTasks { allTasks in
            allTasks.forEach { task in
                task.cancel()
            }
        }
    }
    
    private func createUrlRequestWith(_ endPoint: EndPointType) -> URLRequest? {
        do {
            var headers = endPoint.headers ?? [:]
            var endpointURL = endPoint.url.absoluteString
            
            // if endpointURL has "%253F" we force changing url to "%3F" because Alamofire Lib. is adding spec Symbols (Google it please!)
            if endpointURL.contains("%253F") {
                let newURL = endpointURL.replacingOccurrences(of: "%253F", with: "%3F")
                endpointURL = newURL
            } else if endpointURL.contains("%E2%80%8B") {
                let newURL = endpointURL.replacingOccurrences(of: "%E2%80%8B", with: "")
                endpointURL = newURL
            }
            
            var finalRequest = isTokenNeeded(url: endpointURL, method: endPoint.httpMethod, headers: headers)
            
            finalRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            finalRequest.timeoutInterval = 20
            return try endPoint.encoding.encode(finalRequest, with: endPoint.parameters)
        } catch {
            return nil
        }
    }
    
    private func isTokenNeeded(url: String, method: HTTPMethod, headers: HTTPHeaders) -> URLRequest {
        
        var finalURLRequest = URLRequest(url: URL(fileURLWithPath: ""))
        // Original Logic
        var myURL = url
        let resultURL = eliminateSymbolsFromURLIfNeeded(from: &myURL)
        do {
            let bearerRequest = try URLRequest(url: resultURL, method: method, headers: headers)
            finalURLRequest = bearerRequest
        } catch {
            print("Api error")
        }
        
        // Mock URL
        return finalURLRequest
    }
    
    private func eliminateSymbolsFromURLIfNeeded(from url: inout String) -> String {
        // if endpointURL has "%253F" we force changing url to "%3F" because Alamofire Lib. is adding spec Symbols (Google it please!)
        if url.contains("%253F") {
            url = url.replacingOccurrences(of: "%253F", with: "%3F")
            return url
        }
        return url
    }
}
