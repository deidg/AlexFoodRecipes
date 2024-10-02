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
    
    private let greetingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Jega"
        label.frame.size.height = 17
        let customFont = UIFont(name: "Poppins-ExtraBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        label.font = customFont
        return label
    }()
    private let welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you cooking today?"
        let customFont = UIFont.systemFont(ofSize: 11)
        label.font = customFont
        return label
    }()
    private lazy var greetingsLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingsLabel, welcomeTextLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5.0
        return stackView
    }()
    private let userAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Avatar")
        return imageView
    }()
    private let filterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 18/255, green: 149/255, blue: 117/255, alpha: 255/255)
        let searchIcon = UIImage(named: "search-normal")
        button.setImage(searchIcon, for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let segmentedControll: CustomSegmentedControl = {
        let sC = CustomSegmentedControl()
        return sC
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHomeTabVC()
        setupUI()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupHomeTabVC() {
        
    }
    
    private func setupUI() {
        view.addSubview(greetingsLabelsStackView)
        greetingsLabelsStackView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(64)
            make.height.equalTo(52)
            make.leading.equalTo(view).inset(30)
            make.width.equalTo(195)
        }
        
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(71)
            make.trailing.equalTo(view).inset(16)
            make.width.height.equalTo(40)
        }
        
        view.addSubview(userAccountImageView)
        userAccountImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(71)
            make.right.equalTo(filterButton.snp.left).inset(-10)
            make.width.height.equalTo(40)
        }
        
        view.addSubview(segmentedControll)
        segmentedControll.snp.makeConstraints { make in
            make.top.equalTo(greetingsLabelsStackView.snp.bottom).offset(10)
            make.height.equalTo(51)
            make.leading.trailing.equalTo(view)
        }
    }
    private func addTargets() {
        
    }
}
extension HomeTabVC {
    enum Constants{
        static let mainStackViewstackSpacing = 10.0
    }
}
