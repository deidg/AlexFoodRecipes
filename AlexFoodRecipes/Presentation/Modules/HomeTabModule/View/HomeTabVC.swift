//
//  HomeTabVC.swift
//  AlexFoodRecipes
//
//  Created by Alex on 12.09.2024.
//

import Foundation
import UIKit
import SnapKit


final class HomeTabVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = "Hello Jega"
        let customFont = UIFont(name: "Poppins-ExtraBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        label.font = customFont
        return label
    }()
    private let welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "What are you cooking today?"
        let customFont = UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11)
        label.font = customFont
        return label
    }()
    private lazy var greetingsLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, welcomeTextLabel])
//        stackView.frame = CGRect(x: 0, y: 0, width: 105, height: 52)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5.0
        return stackView
    }()
    private let userAccountImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.frame =  CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.image = UIImage(named: "Avatar")
        return imageView
    }()
    private let filterButton: UIButton = {
        let button = UIButton()
//        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.backgroundColor = UIColor(red: 18/255, green: 149/255, blue: 117/255, alpha: 255/255)
        let searchIcon = UIImage(named: "search-normal")
        button.setImage(searchIcon, for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 15
        return button
    }()
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [greetingsLabelsStackView, userAccountImageView, filterButton])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = Constants.mainStackViewstackSpacing
        return mainStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       setupHomeTabVC()
        setupUI()
    }
    
    func setupHomeTabVC() {
        
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view).offset(71)
            make.leading.equalTo(view).inset(30)
            make.trailing.equalTo(view).inset(16)
            make.height.equalTo(52)
        }
        greetingsLabelsStackView.snp.makeConstraints { make in
            make.width.equalTo(195)
        }
        userAccountImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        filterButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}
extension HomeTabVC {
    enum Constants{
        static let mainStackViewstackSpacing = 10.0
    }
}
