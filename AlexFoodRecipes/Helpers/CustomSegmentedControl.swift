//
//  CustomSegmentedControl.swift
//  AlexFoodRecipes
//
//  Created by Alex on 24.09.2024.
//

import Foundation
import UIKit
import SnapKit


class CustomSegmentedControl: UIView {
    
    var previousIndex = 0
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.bounces = scrollView.contentOffset.x > 100

        return scrollView
    }()
    private var buttonsArray = [UIButton]()
    
    init(buttonsArray: [UIButton]) {
//        init() {
        super.init(frame: .zero)
        self.buttonsArray = buttonsArray
        setupScrollView()
        setupContentButtons(buttonsArray: buttonsArray)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        checkContentFit()
    }
    
    private func checkContentFit() {
        let doesContentFit = scrollView.contentSize.width + 32 <= bounds.width
        
        scrollView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview()
            
            if doesContentFit {
                make.width.equalTo(scrollView.contentSize.width)
                scrollView.isScrollEnabled = false
            } else {
                make.width.equalToSuperview()
                scrollView.isScrollEnabled = true
            }
        }
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupContentButtons(buttonsArray: [UIButton]) {
        var previousButton: UIButton?
        
        for button in buttonsArray {
            button.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .touchUpInside)
            button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 20, bottom: 7, right: 20)
    
            if button != buttonsArray.first {
                button.backgroundColor = .clear
                let customColor: UIColor = Constants.Colors.mainColor
                button.setTitleColor(customColor, for: .normal)
            } else {
                button.backgroundColor = Constants.Colors.mainColor
                button.setTitleColor(.white, for: .normal)
            }
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.titleLabel?.font = Constants.Fonts.mainFontBold
            
            scrollView.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.height.equalTo(scrollView)
                
                if let previousButton = previousButton {
                    make.leading.equalTo(previousButton.snp.trailing).offset(8)
                } else {
                    make.leading.equalTo(scrollView.snp.leading).offset(8)
                }
            }
            previousButton = button
        }
        previousButton?.snp.makeConstraints { make in
            make.trailing.equalTo(scrollView.snp.trailing).offset(-16)
        }
        buttonsArray.first?.isSelected = true
       
    }
    
//    @objc private func segmentedValueChanged(_ sender: UIButton, inputRecipeArr: [Recipe]) {
//        print(sender.titleLabel?.text)      //TODO: to delete
//             
//        var cuisine: String //= sender.titleLabel?.text
//        if cuisine == sender.titleLabel?.text else { return }
//        
//        scrollView.scrollRectToVisible(sender.frame, animated: true)
//        
//        for button in buttonsArray {
//            button.isSelected = false
//            button.backgroundColor = .clear
//            button.setTitleColor(Constants.Colors.mainColor, for: .normal)
//        }
//        sender.isSelected = true
//        sender.backgroundColor = Constants.Colors.mainColor
//        sender.setTitleColor(.white, for: .normal)
//        print("herr118")
//    }
    
    
    @objc private func segmentedValueChanged(_ sender: UIButton) {
        print(sender.titleLabel?.text)      //TODO: to delete
                
        scrollView.scrollRectToVisible(sender.frame, animated: true)
        
        for button in buttonsArray {
            button.isSelected = false
            button.backgroundColor = .clear
            button.setTitleColor(Constants.Colors.mainColor, for: .normal)
        }
        sender.isSelected = true
        sender.backgroundColor = Constants.Colors.mainColor
        sender.setTitleColor(.white, for: .normal)
    }
    
//    func createButtonsForCuisinesButtonScroller(cuisinesNamesArr: [String]) {
//
//        var createButtonsForCuisinesButtonScroller = [UIButton]()
//
//        print("I print inputAllRecipes count a str 283: \(cuisinesNamesArr.count) & cuisineNames: \(cuisinesNamesArr)")
//
//        for cuisine in cuisinesNamesArr {
//            print("str266")
//            let button = UIButton()
//            button.setTitle(cuisine, for: .normal)
//            createButtonsForCuisinesButtonScroller.append(button)
//        }
////        return createButtonsForCuisinesButtonScroller
//        
//        
//        setupContentButtons(buttonsArray: createButtonsForCuisinesButtonScroller)
//    }
    
 
   
}
