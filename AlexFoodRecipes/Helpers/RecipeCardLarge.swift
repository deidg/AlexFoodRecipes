//
//  RecipeCardLarge.swift
//  AlexFoodRecipes
//
//  Created by Alex on 04.10.2024.
//

import Foundation
import UIKit
import SnapKit

final class RecipeCardLarge: UICollectionViewCell {
    private let recipeCell: UIView = {
        let view = UIView()
        return view
    }()
    let backgroundColorView: UIView = {
        let image = UIView()
        image.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        image.layer.cornerRadius = 12
        return image
    }()
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cyan
        image.image = UIImage(named: "recipePic1")
        image.frame = CGRect(x: 0, y: 0, width: 110, height: 110)
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    private let ratingImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 45, height: 23)
        image.backgroundColor = UIColor(red: 255/255, green: 225/255, blue: 179/255, alpha: 1)
        image.layer.cornerRadius = 10 //20
        return image
    }()
    private let starImage: UIImageView = {
        let star = UIImage(named: "RecipeCard_star")
        let image = UIImageView(image: star)
        return image
    }()
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5"
        label.textColor = Constants.FontsColors.fontColorBlack
        label.font = Constants.Fonts.mainFont
        return label
    }()
    private let recipeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Classic Greek Salad"
        label.numberOfLines = 3
        label.textColor = Constants.FontsColors.fontColorGrey1
        label.textAlignment = .center
        label.frame.size = CGSize(width: 130, height: 42)
        return label
    }()
    private let timeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        return label
    }()
    private let cookingTimeInMinutesLabel: UILabel = {
        let label = UILabel()
        label.text = "15 Min"
        label.font = Constants.Fonts.mainFontBold11
        label.textColor = Constants.FontsColors.fontColorGrey1
        return label
    }()
    private let bookmarkBackgroundColorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    private let bookmarkView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "RecipeCard_Bookmark")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(recipeCell)
        recipeCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        recipeCell.addSubview(backgroundColorView)
        backgroundColorView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(recipeCell)
            make.height.equalTo(176)
        }
        recipeCell.addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.top.equalTo(recipeCell)
            make.centerX.equalTo(recipeCell)
            make.height.equalTo(110)
            make.width.equalTo(109)
        }
        recipeCell.addSubview(ratingImage)
        ratingImage.snp.makeConstraints { make in
            make.top.equalTo(recipeCell).inset(30)
            make.leading.equalTo(recipeCell).inset(105)
            make.height.equalTo(23)
            make.width.equalTo(45)
        }
        ratingImage.addSubview(starImage)
        starImage.snp.makeConstraints { make in
            make.top.bottom.equalTo(ratingImage).inset(6.5)
            make.leading.equalTo(ratingImage).inset(7)
            make.height.width.equalTo(10)
        }
        ratingImage.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.height.width.equalTo(17)
            make.top.bottom.equalTo(ratingImage).inset(3)
            make.trailing.equalTo(ratingImage).inset(7)
        }
        recipeCell.addSubview(recipeNameLabel)
        recipeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).offset(11)
            make.centerX.equalTo(recipeCell)
            make.height.equalTo(42)
            make.width.equalTo(130)
        }
        recipeCell.addSubview(timeTextLabel)
        timeTextLabel.snp.makeConstraints { make in
            make.top.equalTo(recipeNameLabel.snp.bottom).offset(19)
            make.height.equalTo(17)
            make.width.equalTo(27)
            make.leading.equalTo(recipeCell).inset(10)
        }
        recipeCell.addSubview(cookingTimeInMinutesLabel)
        cookingTimeInMinutesLabel.snp.makeConstraints { make in
            make.top.equalTo(timeTextLabel.snp.bottom).offset(5)
            make.leading.equalTo(recipeCell).inset(10)
            make.height.equalTo(17)
            make.width.equalTo(40)
        }
        backgroundColorView.addSubview(bookmarkBackgroundColorView)
        bookmarkBackgroundColorView.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.trailing.equalTo(backgroundColorView).inset(10)
            make.bottom.equalTo(cookingTimeInMinutesLabel.snp.bottom)
        }
        bookmarkBackgroundColorView.addSubview(bookmarkView)
        bookmarkView.snp.makeConstraints { make in
            make.edges.equalTo(bookmarkBackgroundColorView)
        }
    }
}
