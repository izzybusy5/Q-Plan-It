//
//  QPButton.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import SwiftUI

struct QPButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
            
        }
    }
}

struct QPButton_Previews: PreviewProvider {
    static var previews: some View {
        QPButton(title: "Value",
                 background: .green) {
        }
    }
}
