//
//  HomeTabVcRecipeCardSmall.swift
//  AlexFoodRecipes
//
//  Created by Alex on 06.10.2024.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class HomeTabVcRecipeCardSmall: UICollectionViewCell {
    private let contentCellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.blue.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
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
//        image.image = UIImage(named: "newRecipeImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
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
        
        isSkeletonable = true
        skeletonCornerRadius = 10
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(contentCellView)
        contentCellView.snp.makeConstraints { make in
            make.height.equalTo(95)
            make.leading.equalToSuperview().inset(12)  // отступ для тени
            make.trailing.bottom.equalToSuperview()
        }
        contentCellView.addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(contentCellView.snp.top).inset(10)
            make.leading.equalTo(contentCellView).inset(9.3)
            make.width.equalTo(140)
        }
        contentCellView.addSubview(ratingStarsStackView)
        ratingStarsStackView.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.leading.equalTo(contentCellView).inset(9.3)
            make.top.equalTo(recipeNameLabel.snp.bottom).offset(5)
        }
        contentCellView.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.leading.equalTo(contentCellView).inset(9.3)
            make.bottom.equalToSuperview().inset(10)
        }
        contentCellView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(89)
            make.height.equalTo(17)
            make.bottom.equalToSuperview().inset(14)
            make.leading.equalTo(userImage.snp.trailing).offset(8)
        }
        contentCellView.addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(9)
            make.top.equalTo(contentView)
            make.width.height.equalTo(80)
        }
        contentCellView.addSubview(cookingTimeImage)
        cookingTimeImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(55)
        }
        contentCellView.addSubview(cookingTimeInMinutesLabel)
        cookingTimeInMinutesLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14)
            make.trailing.equalToSuperview().inset(7)
        }
    }
    //MARK: Private methods
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
    //MARK: public methods
    func configure(with recipe: NewRecipes) {
        recipeNameLabel.text = recipe.recipeName
        cookingTimeInMinutesLabel.text = "\(recipe.cookingTime) Min"
        showRatingStars(recipeRating: Int(recipe.rating))
        foodImage.kf.setImage(with: URL(string: recipe.imageURL))
        userNameLabel.text = recipe.author
    }
}
