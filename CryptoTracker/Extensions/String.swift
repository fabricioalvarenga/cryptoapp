//
//  String.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 23/01/23.
//

import Foundation

extension String {
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]*>", with: "", options: .regularExpression, range: nil)
    }
}
