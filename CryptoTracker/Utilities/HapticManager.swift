//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 13/12/22.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
