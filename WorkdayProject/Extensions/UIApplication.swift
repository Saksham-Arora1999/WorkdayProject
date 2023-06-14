//
//  UIApplication.swift
//  WorkdayProject
//
//  Created by user242726 on 6/13/23.
//


import Foundation
import SwiftUI

extension UIApplication {
    func endEdititng() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
