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
    //TODO: to orginize elements order
    let recipeCard = RecipeCardLarge()
    private var dishesSliderView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.estimatedItemSize = CGSize(width: 150, height: 231)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.bounces = view.contentOffset.x > 100
        view.register(RecipeCardLarge.self, forCellWithReuseIdentifier: "RecipeCardLarge")
        return view
    }()
    private let newRecipeCard = RecipeCardSmall()
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
    
    private let newRecipesLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 103, height: 24) // (x: 0, y: 0, width: 103, height: 24)
        label.text = "New Recipe"
        label.font = Constants.Fonts.mainFontBold16
        label.textColor = .black
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        //        setupDishesSlider()
    }
    private func setupDelegates() {
        dishesSliderView.delegate = self
        dishesSliderView.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
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
            make.leading.trailing.equalTo(view).inset(20)
        }
        view.addSubview(dishesSliderView)
        dishesSliderView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControll.snp.bottom).offset(15)
            make.leading.equalTo(view).inset(30)
            make.height.equalTo(231)
            make.width.equalTo(375)
        }
        
        view.addSubview(newRecipesLabel)
        newRecipesLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).inset(30)
            make.top.equalTo(dishesSliderView.snp.bottom).offset(20)
        }
        
        view.addSubview(newRecipeCard)
        newRecipeCard.snp.makeConstraints { make in
            make.leading.equalTo(view).inset(30)
            make.width.equalTo(251)
            make.height.equalTo(127)
            make.bottom.equalTo(view.snp.bottom).inset(150)
            
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
    //    private func setupDishesSlider() {
    //        let layout = UICollectionViewFlowLayout()
    //                layout.scrollDirection = .horizontal
    //                layout.minimumLineSpacing = 15
    //                layout.estimatedItemSize = CGSize(width: 150, height: 231)
    //                let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    //                view.showsHorizontalScrollIndicator = false
    //                view.register(RecipeCard.self, forCellWithReuseIdentifier: "RecipeCard")
    //    }
}
extension HomeTabVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
//        collectionView.accessibilityElementCount()
    //        segmentedControll.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardLarge", for: indexPath)
        return cell
    }
}
