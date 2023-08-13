//
//  HeaderView.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                
            VStack {
                
                Text (title)
                    .font(.system(size:60))
                    .foregroundColor(Color.white)
                    .bold()
                Text (subtitle)
                    .font(.system(size:21))
                    .foregroundColor(Color.white)
                    
            }
            .padding(.top, 50)
        }
 
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -80)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", background: .blue)
    }
}
