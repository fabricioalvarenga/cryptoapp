//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 30/11/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
