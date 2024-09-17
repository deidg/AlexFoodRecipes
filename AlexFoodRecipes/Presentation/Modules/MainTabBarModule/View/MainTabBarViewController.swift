//
//  ViewController.swift
//  AlexFoodRecipes
//
//  Created by Alex on 08.09.2024.
//

import UIKit
import Foundation
import SnapKit


class MainTabBarViewController: UITabBarController/*, AnyViewController*/ {
    private let addRecipeButton : UIButton = {
        let addRecipeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        addRecipeButton.setTitle("", for: .normal)
        addRecipeButton.backgroundColor = UIColor(red: 18/255, green: 149/255, blue: 117/255, alpha: 255/255)
        addRecipeButton.layer.cornerRadius = 30
        addRecipeButton.layer.shadowColor = UIColor.red.cgColor
        addRecipeButton.layer.shadowOpacity = 0.2
        addRecipeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        addRecipeButton.setBackgroundImage(UIImage(named: "Nav Bar Menu"), for: .normal)
        return addRecipeButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabItems()
        setupBottomView()
        addTargets()
        setupAddRecipeButton()
    }    
        override func loadView() {
        super.loadView()
        setupCustomTabBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabBarHeight: CGFloat = 100
        var tabFrame = tabBar.frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = view.frame.size.height - tabBarHeight
        tabBar.frame = tabFrame
    }
    private func setupCustomTabBar() {
        let path: UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.itemWidth = 40
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 150
        self.tabBar.tintColor = UIColor.red
    }
    private func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 20
        let holeWidth = 150
        let holeHeight = 50
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole, y: 0)) //1 line
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth/3), y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*6,y: 0), controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*8, y: holeHeight/2)) // part I
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2*holeWidth)/3, y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2/5, y: (holeHeight/2)*6/4), controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2 + (holeWidth/3)/3*3/5, y: (holeHeight/2)*6/4)) // part II
        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + (2*holeWidth)/3,y: holeHeight/2), controlPoint2: CGPoint(x: leftXUntilHole + (2*holeWidth)/3 + (holeWidth/3)*2/8, y: 0)) // part III
        path.addLine(to: CGPoint(x: frameWidth, y: 0)) // 2. Line
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight)) // 3. Line
        path.addLine(to: CGPoint(x: 0, y: frameHeight)) // 4. Line
        path.addLine(to: CGPoint(x: 0, y: 0)) // 5. Line
        path.close()
        return path
    }
    private func setupAddRecipeButton() {
        addRecipeButton.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 25, y: -20, width: 50, height: 50)   // - 30, y: -20, width: 55, height: 55)
        self.tabBar.addSubview(addRecipeButton)
        
        addRecipeButton.isEnabled = true
    }
    private func setupCustomTabItems() {
        let homeTabVC = UINavigationController(rootViewController: HomeTabVC())
        let favouritesTabVC = UINavigationController(rootViewController: FavouritesTab())
        let notificationsTabVC = UINavigationController(rootViewController: NotificationsTabVC())
        let accountTabVC = UINavigationController(rootViewController: AccountTabVC())
        homeTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home-2"), tag: 0)
        favouritesTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Inactive"), tag: 0)
        notificationsTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "notification-bing"), tag: 0)
        accountTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named:  "profile"), tag: 0)
        self.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        viewControllers = [homeTabVC, favouritesTabVC, notificationsTabVC, accountTabVC]
    }
    private func setupBottomView() {
        let bottomView: UIView = UIView()
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    func addTargets() {
        addRecipeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    @objc private func buttonPressed() {
        print("herr")
    }
    
}
