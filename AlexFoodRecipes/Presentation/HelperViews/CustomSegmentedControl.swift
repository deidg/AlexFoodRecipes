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
        return scrollView
    }()
    
    private lazy var allCuisineButton: UIButton =  {
        let button = UIButton()
        button.backgroundColor = Constants.customColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var indianCuisineButton = UIButton()
    private lazy var italianCuisineButton = UIButton()
    private lazy var asianCuisineButton = UIButton()
    private lazy var chineseCuisineButton = UIButton()
    private lazy var mexicanCuisineButton = UIButton()
    private lazy var greekCuisineButton = UIButton()
    
    private var buttons = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupContentButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        setupContentButtons()
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
    
    private func setupContentButtons() {
        allCuisineButton.setTitle("All", for: .normal)
        indianCuisineButton.setTitle("Indian", for: .normal)
        italianCuisineButton.setTitle("Italian", for: .normal)
        asianCuisineButton.setTitle("Asian", for: .normal)
        chineseCuisineButton.setTitle("Chinese", for: .normal)
        mexicanCuisineButton.setTitle("Mexican", for: .normal)
        greekCuisineButton.setTitle("Greek", for: .normal)
        
        buttons = [allCuisineButton, indianCuisineButton, italianCuisineButton, asianCuisineButton, chineseCuisineButton, mexicanCuisineButton, greekCuisineButton]
        
        var previousButton: UIButton?
        
        for button in buttons {
            button.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .touchUpInside)

            if button != allCuisineButton {
                button.backgroundColor = .clear
                let customColor: UIColor = Constants.customColor
                button.setTitleColor(customColor, for: .normal)
            }
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            if let customFont = UIFont(name: "Poppins-Bold", size: 17) {
                button.titleLabel?.font = customFont
                let customColor: UIColor = Constants.customColor
            } else {
                button.titleLabel?.font = .boldSystemFont(ofSize: 17)
            }
            
            scrollView.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.height.equalTo(scrollView)
                
                if let previousButton = previousButton {
                    make.leading.equalTo(previousButton.snp.trailing).offset(8)
                } else {
                    make.leading.equalTo(scrollView.snp.leading).offset(16)
                }
            }
            previousButton = button
        }
        previousButton?.snp.makeConstraints { make in
            make.trailing.equalTo(scrollView.snp.trailing).offset(-16)
        }
        allCuisineButton.isSelected = true
    }
    @objc private func segmentedValueChanged(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        
        guard let index = buttons.firstIndex(of: sender) else { return }
        
        scrollView.scrollRectToVisible(sender.frame, animated: true)
        
        for button in buttons {
            button.isSelected = false
            button.backgroundColor = .clear
            button.setTitleColor(Constants.customColor, for: .normal)
        }
        sender.isSelected = true
        sender.backgroundColor = Constants.customColor
        sender.setTitleColor(.white, for: .normal)
    }
}
extension CustomSegmentedControl {
    enum Constants {
        static let customColor: UIColor = UIColor(red: 18/255, green: 149/255, blue: 117/255, alpha: 1)
    }
    
}
