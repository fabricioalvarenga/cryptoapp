//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by FABRICIO ALVARENGA on 06/12/22.
//

import SwiftUI

struct XMarkButton: View {
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action!()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
