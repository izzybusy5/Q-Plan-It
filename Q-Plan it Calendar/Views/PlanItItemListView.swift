//
//  PlanItItemView.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import SwiftUI

struct PlanItItemView: View {
    @StateObject var viewModel = PlanItListItemViewModel()
    let item: PlanItItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.eventDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ?
                    "checkmark.circle.fill" : "circle")
                .foregroundColor(Color.blue)
            }
        }
    }
}

struct PlanItItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlanItItemView(item: .init(
            id: "555",
            title: "lets party",
            eventDate: Date().timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: true
        ))
    }
}
