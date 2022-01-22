//
//  UserDefaults+Utils.swift
//  Trashsure
//
//  Created by Ferdinand on 22/01/22.
//

import Foundation

extension UserDefaults {

    private enum Keys {
        static let skipOnBoard = "isSkipOnBoardingPage"
    }

    class var isSkipOnBoard: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.skipOnBoard)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.skipOnBoard)
        }
    }

}
