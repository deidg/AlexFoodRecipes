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
        label.font = Constants.Fonts.mainFontExtraBold
        return label
    }()
    private let welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you cooking today?"
        label.font =  UIFont.systemFont(ofSize: 11)
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
        button.backgroundColor = Constants.Colors.mainColor
        let searchIcon = UIImage(named: "search-normal")
        button.setImage(searchIcon, for: .normal)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 15
        return button
    }()
    private lazy var segmentedControll = CustomSegmentedControl(buttonsArray: createButtonsForSegmentedControll())
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
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
            make.top.equalTo(greetingsLabelsStackView.snp.bottom).offset(20)
            make.height.equalTo(31)
            make.leading.trailing.equalTo(view)
        }
    }
    
    private func createButtonsForSegmentedControll() -> [UIButton] {
        var buttonsArrForSegmentedControl = [UIButton]()

        let allCuisineButton = UIButton()
        let indianCuisineButton = UIButton()
        let italianCuisineButton = UIButton()
        let asianCuisineButton = UIButton()
        let chineseCuisineButton = UIButton()
        let mexicanCuisineButton = UIButton()
        let greekCuisineButton = UIButton()
        
        allCuisineButton.setTitle("All", for: .normal)
        indianCuisineButton.setTitle("Indian", for: .normal)
        italianCuisineButton.setTitle("Italian", for: .normal)
        asianCuisineButton.setTitle("Asian", for: .normal)
        chineseCuisineButton.setTitle("Chinese", for: .normal)
        mexicanCuisineButton.setTitle("Mexican", for: .normal)
        greekCuisineButton.setTitle("Greek", for: .normal)
        
        buttonsArrForSegmentedControl = [allCuisineButton, indianCuisineButton, italianCuisineButton, asianCuisineButton, chineseCuisineButton, mexicanCuisineButton, greekCuisineButton]
        
        return buttonsArrForSegmentedControl
    }
}
