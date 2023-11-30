//
//  SGButtonLR.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI

struct SGButtonLR: View {
    let title: String
    let action: () -> Void

    var body: some View {
        createButton()
    }

    private func createButton() -> some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.5,
                           height: UIScreen.main.bounds.height / 18)
                    .padding()

                Text(title)
                    .foregroundColor(.black)
                    .bold()
            }
        }
    }
}

struct SGButtonLR_Previews: PreviewProvider {
    static var previews: some View {
        SGButtonLR(title: "login") {
            // Action
        }
    }
}

struct ButtonFactory {
    static func createButton(title: String, action: @escaping () -> Void) -> SGButtonLR {
        return SGButtonLR(title: title, action: action)
    }
}
