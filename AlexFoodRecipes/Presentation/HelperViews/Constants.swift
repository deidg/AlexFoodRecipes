//
//  Constants.swift
//  AlexFoodRecipes
//
//  Created by Alex on 03.10.2024.
//

import UIKit


enum Constants {
    enum Colors {
        static let mainColor: UIColor = UIColor(red: 18/255, green: 149/255, blue: 117/255, alpha: 1)
        
        
    }
    enum Fonts {
        static let mainFontBold = UIFont(name: "Poppins-Bold", size: 17)
        static let mainFontBold11 = UIFont(name: "Poppins-Bold", size: 11)

        static let mainFontBold14 = UIFont(name: "Poppins-Bold", size: 14)
        static let mainFontBold16 = UIFont(name: "Poppins-Bold", size: 16)
        static let mainFontBold17 = UIFont(name: "Poppins-Bold", size: 17)
        
        static let mainFontExtraBold = UIFont(name: "Poppins-ExtraBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
        
        
        static let mainFont = UIFont(name: "Poppins-Regular", size: 11) ?? UIFont.systemFont(ofSize: 11)
        
    }
    enum FontsColors {
        
        static let fontColorBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        static let fontColorGrey1 = UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1)
//        static let fontColorGrey2 = UIColor(red: 193, green: 193, blue: 193, alpha: 1)
        
        static let fontColorGrey3 = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1)

    }

}


