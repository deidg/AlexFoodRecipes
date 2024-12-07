//
//  BaseViewController.swift
//  AlexFoodRecipes
//
//  Created by Vlad on 08.09.2024.
//

import Foundation
import UIKit

class BaseViewController<P>: UIViewController, AnyViewController {
    
    var presenter: P?
    private var viewOutput: AnyViewOutput{
        guard let output = presenter as? AnyViewOutput else {
            fatalError("\(String(describing: P.self))) does not conform to protocol AnyViewOutput")
        }
      return output
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutput.onViewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewOutput.onViewWillAppear()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewOutput.onViewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewOutput.onViewWillDisappear()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewOutput.onViewDidDisappear()
    }    
}
