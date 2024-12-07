//
//  AccountTabVC.swift
//  AlexFoodRecipes
//
//  Created by Alex on 12.09.2024.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
import SkeletonView


final class AccountTabVC: UIViewController {
    
    //    profileLabel
    private let profileLabel: UILabel  = {
        let label = UILabel()
        label.text = "Profile"
        label.textAlignment = .center
        label.backgroundColor = .orange
        
        return label
    }()
    //     authorPhoto
    private var authorImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.frame.size = CGSize(width: 99, height: 99)
        imageView.image = UIImage(named: "cookImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let actionButton: UIButton = {
        let button = UIButton()
        let picture = UIImage(named: "3dots")
        button.setImage(picture, for: .normal) //= UIImage(named: "3dots")
        return button
    }()
    
    //    RecipeLabel
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "Recipe"
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        label.textAlignment = .center
        return label
    }()
    //FollowersLabel
    let followersLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "Followers"
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        return label
    }()
    //FollowingLabel
    let followingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "Following"
        label.font = Constants.Fonts.mainFont
        label.textColor = Constants.FontsColors.fontColorGrey3
        return label
    }()
    
    private lazy var textLabelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.recipeLabel, self.followersLabel, self.followingLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        stackView.backgroundColor =  .systemPink
        stackView.spacing = 25
        stackView.contentMode = .scaleAspectFit
        return stackView
    }()
    
    //    RecipeCountLabel
    let recipeCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.text = "4"
        label.font = Constants.Fonts.mainFontExtraBold
        label.textColor = Constants.FontsColors.fontColorCustomBlack
        return label
    }()
    //FollowersCountLabek
    let followersCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.text = "2.5M"
        label.font = Constants.Fonts.mainFontExtraBold
        label.textColor = Constants.FontsColors.fontColorCustomBlack
        return label
    }()
    //FollowinfCountLabel
    let followingCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.text = "259"
        label.font = Constants.Fonts.mainFontExtraBold
        label.textColor = Constants.FontsColors.fontColorCustomBlack
        return label
    }()
    // authorName Label
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Afuwape Abiodun"
        label.textColor = Constants.FontsColors.fontColorCustomBlack
        label.font = Constants.Fonts.mainFontBold16
        return label
    }()
    // jobTitleLable
    let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .alizarin
        label.text = "Chef"
        label.textColor = Constants.FontsColors.fontColorGrey3
        label.font = Constants.Fonts.mainFont
        return label
    }()
    //AuthorDescriptionLabel
    let authorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .amethyst
        
        label.textColor = Constants.FontsColors.fontColorGrey3
        label.font = Constants.Fonts.mainFont
        
        label.text = "Private Chef Passionate about food and life"
        label.numberOfLines = 3 //  TODO: MORE!!!! - how to make??
        
        return label
    }()
    private lazy var contentSegmentedController = CustomSegmentedControl(buttonsArray: createContentButtons())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    
    func setupUI() {
        view.addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(58)
            make.height.equalTo(27)
            
            //TODO: NAVigation controller?
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(10)
        }
        view.addSubview(authorImageView)
        authorImageView.snp.makeConstraints { make in
            //            make.center.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(85)
            make.leading.equalTo(view).inset(22)
            make.height.width.equalTo(99)
        }
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(10)
            //56
            make.trailing.equalTo(view).inset(30)
        }
        
        //TODO: make StackView of labels?
        
        
        view.addSubview(textLabelsStackView)
        textLabelsStackView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(25)  //25
            make.left.equalTo(authorImageView.snp.right).offset(35) /// 35
            make.trailing.equalTo(view).inset(30)
        }
        
        
        //        view.addSubview(recipeLabel)
        //        recipeLabel.snp.makeConstraints { make in
        //            make.width.equalTo(38)
        //            make.height.equalTo(17)
        //            make.top.equalTo(profileLabel.snp.bottom).offset(25)  //25
        //            make.left.equalTo(authorImageView.snp.right).offset(35) /// 35
        //        }
        //        view.addSubview(followersLabel)
        //        followersLabel.snp.makeConstraints { make in
        //            make.width.equalTo(51)
        //            make.height.equalTo(17)
        //            make.top.equalTo(profileLabel.snp.bottom).offset(25)  //25
        //            make.left.equalTo(recipeLabel.snp.right).offset(25) /// 35
        //        }
        //        view.addSubview(followingLabel)
        //        followingLabel.snp.makeConstraints { make in
        //            make.width.equalTo(52)
        //            make.height.equalTo(17)
        //            make.top.equalTo(profileLabel.snp.bottom).offset(25)  //25
        //            make.left.equalTo(followersLabel.snp.right).offset(25) /// 35
        //        }
        
        
        
        //        view.addSubview(recipeCountLabel)
        //        recipeCountLabel.snp.makeConstraints { make in
        //            make.width.equalTo(14)
        //            make.height.equalTo(30)
        //            make.top.equalTo(recipeLabel.snp.bottom).offset(2)
        //            make.left.equalTo(recipeLabel.snp.left).offset(12)
        //        }
        //        view.addSubview(followersCountLabel)
        //        followersCountLabel.snp.makeConstraints { make in
        //            make.width.equalTo(50)   //48
        //            make.height.equalTo(30)
        //            make.top.equalTo(followersLabel.snp.bottom).offset(2)
        //            make.left.equalTo(followersLabel.snp.left).offset(1)  //1.5
        //        }
        //        view.addSubview(followingCountLabel)
        //        followingCountLabel.snp.makeConstraints { make in
        //            make.width.equalTo(37)
        //            make.height.equalTo(30)
        //            make.top.equalTo(followingLabel.snp.bottom).offset(2)
        //            make.left.equalTo(followingLabel.snp.left).offset(7.5)
        //        }
        
        
        view.addSubview(authorNameLabel)
        authorNameLabel.snp.makeConstraints { make in
            //            make.top.equalTo(authorImageView.snp.bottom).inset(25)   //15
            make.top.equalTo(view).inset(325)  //205
            make.leading.equalTo(view).inset(30)   //30
            make.height.equalTo(24)
            make.width.equalTo(246) //146
        }
        
        view.addSubview(jobTitleLabel)
        jobTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(authorNameLabel.snp.bottom)//.inset(1) //0
            make.leading.equalTo(view).inset(30)
            make.width.equalTo(26)
            make.height.equalTo(17)
        }
        
        view.addSubview(authorDescriptionLabel)
        authorDescriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(51)
            make.width.equalTo(256)
            make.leading.equalTo(view).inset(30)
            make.trailing.equalTo(view).inset(89)
            make.top.equalTo(jobTitleLabel.snp.bottom).inset(10)
        }
        
        view.addSubview(contentSegmentedController)
        contentSegmentedController.snp.makeConstraints { make in
            make.top.equalTo(authorDescriptionLabel.snp.bottom).offset(15)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(33)    //58
        }
        
    }
    private func createContentButtons() -> [UIButton] {
        var contentButtonsArr = [UIButton]()
        
        let recipesContentButton = UIButton()
        let videoContentButton = UIButton()
        let tagContentButton = UIButton()
        
        recipesContentButton.setTitle("Recipe", for: .normal)
        videoContentButton.setTitle("Videos", for: .normal)
        tagContentButton.setTitle("Tag", for: .normal)
        
        contentButtonsArr = [recipesContentButton, videoContentButton, tagContentButton]
        
        return contentButtonsArr
    }
    
}
//make.center.equalToSuperview()
