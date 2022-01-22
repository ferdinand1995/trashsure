//
//  UIFont+Utils.swift
//  Trashsure
//
//  Created by Ferdinand on 22/01/22.
//

import UIKit.UIFont

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }

    static func mainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Poppins-Regular", size: size)
    }

    static func boldMainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Poppins-Bold", size: size)
    }

    static func semiBoldMainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Poppins-SemiBold", size: size)
    }

    static func mediumMainFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Poppins-Medium", size: size)
    }

    static func additionFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "Alata-Regular", size: size)
    }

}
