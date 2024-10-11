//
//  RecipeCardSmall.swift
//  AlexFoodRecipes
//
//  Created by Alex on 06.10.2024.
//

import Foundation
import UIKit
import SnapKit

final class RecipeCardSmall: UICollectionViewCell {
    
    private let newRecipeCellView: UIView = {
        let view = UIView()
//        view.backgroundColor = .lightGray
        return view
    }()
    
    private let contentCellView: UIView = {
        let view = UIView()
        view.layer.shadowOpacity = 0.8
//        view.layer.shadowOffset = .zero
                view.layer.shadowOffset = CGSize(width: 10, height: 5)
        view.layer.shadowRadius = 50
        view.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Steak with tomatoes"
        label.numberOfLines = 2
        label.font = Constants.Fonts.mainFontBold14
        label.textColor = Constants.FontsColors.fontColorGrey1
        return label
    }()
    private let starForRating: UIImageView = {
        let star = UIImage(named: "RecipeCard_star")
        let image = UIImageView(image: star)
        return image
    }()
    private let ratingStarsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    let recipeRating: Int = 4
    
    private let userImage: UIImageView = {
        let userImage = UIImageView()
        userImage.image = UIImage(named: "userImage")
        userImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return userImage
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        return label
    }()
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "newRecipeImage")
        image.frame = CGRect(x: 0, y: 0, width: 80, height: 86)
        //        image.layer.cornerRadius = image.frame.size.width / 2
        return image
    }()
    
    private let cookingTimeInMinutesLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        label.frame.size.height = 17
        label.frame.size.width = 43
        return label
    }()
    
    private let cookingTimeImage: UIImageView = {
        let cookingTimeImage = UIImageView()
        cookingTimeImage.image = UIImage(named: "cookingTimeImage")
        cookingTimeImage.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        return cookingTimeImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        showCookingTimeInMinutes(minutes: 21)
        showUserName(name: "James Milner")
        
        
        showRatingStars(recipeRating: recipeRating)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(newRecipeCellView)
        newRecipeCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        addSubview(contentCellView)
        contentCellView.snp.makeConstraints { make in
            make.width.equalTo(251)
            make.height.equalTo(95)
            make.leading.trailing.bottom.equalToSuperview()
        }
        addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(contentCellView.snp.top).inset(10)
            make.leading.equalToSuperview().inset(9.3)
            make.width.equalTo(140)
        }
        addSubview(ratingStarsStackView)
        ratingStarsStackView.snp.makeConstraints { make in
            make.height.equalTo(12)
            //            make.width.equalTo(63)
            make.leading.equalToSuperview().inset(9.3)
            make.top.equalTo(recipeNameLabel.snp.bottom).offset(5)
        }
        addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(9.3)
            make.bottom.equalToSuperview().inset(10)
        }
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(89)
            make.height.equalTo(17)
            make.bottom.equalToSuperview().inset(14)
            make.left.equalTo(userImage.snp.right).offset(8)
        }
        addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(9.3)
            make.top.equalToSuperview()
            //            make.width.equalTo(80)
            //            make.height.equalTo(86)
        }
        addSubview(ratingStarsStackView)
        ratingStarsStackView.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(63)
            make.top.equalTo(recipeNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(9.3)
        }
        addSubview(cookingTimeImage)
        cookingTimeImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(55)
        }
        addSubview(cookingTimeInMinutesLabel)
        cookingTimeInMinutesLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(7)
        }
    }
    
    //MARK: Private funcions
    private func showCookingTimeInMinutes(minutes: Int) {
        cookingTimeInMinutesLabel.text = "\(minutes) mins"
    }
    
    private func showUserName(name: String) {
        userNameLabel.text = "By \(name)"
    }
    
    private func showRatingStars(recipeRating: Int) {
        for _ in 0..<5 {
            let starImage = UIImage(named: "RecipeCard_star")
            let starImageView = UIImageView(image: starImage)
            starImageView.contentMode = .scaleAspectFit
            
            if ratingStarsStackView.arrangedSubviews.count < recipeRating {
                ratingStarsStackView.addArrangedSubview(starImageView)
            } else {
                let emptyStarImage = UIImage(named: "RecipeCard_emptyStar")
                let emptyStarImageView = UIImageView(image: emptyStarImage)
                emptyStarImageView.contentMode = .scaleAspectFit
                ratingStarsStackView.addArrangedSubview(emptyStarImageView)
            }
        }
    }
}
