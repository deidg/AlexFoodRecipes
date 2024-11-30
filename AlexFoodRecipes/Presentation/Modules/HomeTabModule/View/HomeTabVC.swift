
//
//  HomeTabVC.swift
//  AlexFoodRecipes
//
//  Created by Alex on 12.09.2024.
//

import Foundation
import UIKit
import SnapKit
import SkeletonView


final class HomeTabVC: BaseViewController<HomeTabViewOutput>, CustomSegmentedControlDelegate {
    func showChosenCuisine(chosenCuisine: String) {
        
        presenter?.filterRecipeResultsByCuisine(chosenCuisine)
        
    }
   
    enum State {
        case initial
        case skeletonable
        case result
    }
    
    private var state: State = .initial {
        didSet {
            switch state {
            case .initial:
                hideSkeletons()
            case .skeletonable:
                showSkeletons()
            case .result:
                self.allRecipesCollectionView.reloadData()
                self.newRecipesCollectionView.reloadData()
                
                hideSkeletons()
            }
        }
    }
    
    var currentPage = 1
    var totalPages = 1
    
    private var allRecipesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.estimatedItemSize = CGSize(width: 150, height: 231)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.bounces = view.contentOffset.x > 100
        view.register(HomeTabVcRecipeCardLarge.self, forCellWithReuseIdentifier: "HomeTabVcRecipeCardLarge")
        view.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)
        
        view.isSkeletonable = true
        
        return view
    }()
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
    private let newRecipesLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 103, height: 24)
        label.text = "New Recipe"
        label.font = Constants.Fonts.mainFontBold16
        label.textColor = .black
        return label
    }()
    private var newRecipesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.estimatedItemSize = CGSize(width: 251, height: 127)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.bounces = view.contentOffset.x > 100
        view.register(HomeTabVcRecipeCardSmall.self, forCellWithReuseIdentifier: "HomeTabVcRecipeCardSmall")
        view.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 20)
        view.backgroundColor = .white
        
        view.isSkeletonable = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        
        allRecipesCollectionView.isSkeletonable = true
        newRecipesCollectionView.isSkeletonable = true
        
        state = .skeletonable
    }
    
    private func setupDelegates() {
        allRecipesCollectionView.delegate = self
        allRecipesCollectionView.dataSource = self
        newRecipesCollectionView.delegate = self
        newRecipesCollectionView.dataSource = self
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
        view.addSubview(allRecipesCollectionView)
        allRecipesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(greetingsLabelsStackView.snp.bottom).offset(86)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(231)
        }
        view.addSubview(newRecipesLabel)
        newRecipesLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).inset(30)
            make.top.equalTo(allRecipesCollectionView.snp.bottom).offset(20)
        }
        view.addSubview(newRecipesCollectionView)
        newRecipesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newRecipesLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(139)
        }
    }
    // - MARK: Private methods
    // SKELETONS:
    private func showSkeletons() {
        allRecipesCollectionView.showAnimatedGradientSkeleton()
        newRecipesCollectionView.showAnimatedGradientSkeleton()
    }
    
    private func hideSkeletons() {
        allRecipesCollectionView.hideSkeleton()
        newRecipesCollectionView.hideSkeleton()
    }
    
    private func setupCustomSegmentedControl(buttons: [UIButton]) {
        let cuisinesButtonScroller = CustomSegmentedControl(buttonsArray: buttons)
        
        cuisinesButtonScroller.delegate = self
        
        view.addSubview(cuisinesButtonScroller)
        cuisinesButtonScroller.snp.makeConstraints { make in
            make.top.equalTo(greetingsLabelsStackView.snp.bottom).offset(20)
            make.height.equalTo(40)  
            make.leading.trailing.equalTo(view).inset(10)
        }
    }
    
    private func createButtonsForCuisinesButtonScroller(cuisinesNamesArr: [String]) {
        let newNames = ["All"] + cuisinesNamesArr
        var listOfCuisineNames = [UIButton]()
        
        for cuisine in newNames {
            let button = UIButton()
            button.setTitle(cuisine, for: .normal)
            listOfCuisineNames.append(button)
        }
        setupCustomSegmentedControl(buttons: listOfCuisineNames)
    }    
    
    @objc func loadData() {
        currentPage += 1
        
        allRecipesCollectionView.reloadData()
        
    }
}

extension HomeTabVC: UICollectionViewDelegate, UICollectionViewDataSource, SkeletonCollectionViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        if skeletonView == allRecipesCollectionView {
            return "HomeTabVcRecipeCardLarge"
        } else {
            return "HomeTabVcRecipeCardSmall"
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == allRecipesCollectionView {
            return presenter?.filteredRecipesByChosenCuisine.count ?? 0
        } else if collectionView == newRecipesCollectionView {
            return presenter?.newRecipes.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == allRecipesCollectionView {
            guard let presenter,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabVcRecipeCardLarge", for: indexPath) as? HomeTabVcRecipeCardLarge else {
                return UICollectionViewCell()
            }
            cell.configure(with: presenter.filteredRecipesByChosenCuisine[indexPath.item])
            return cell
        } else {
            guard let presenter,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabVcRecipeCardSmall", for: indexPath) as? HomeTabVcRecipeCardSmall else {
                return UICollectionViewCell()
            }
            cell.configure(with: presenter.newRecipes[indexPath.item])
            return cell
        }
    }
}

extension HomeTabVC: HomeTabViewInput {
    
    func sendCusisineArray(cuisinesNamesArr: [String]) {
        
        createButtonsForCuisinesButtonScroller(cuisinesNamesArr: cuisinesNamesArr)
        
    }
    
    func populateWith(state: State) {
        self.state = state
    }
    func populateWithNewRecipes(state: State) {
        self.state = state
    }
}


