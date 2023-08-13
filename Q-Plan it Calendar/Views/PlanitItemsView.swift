//
//  PlanitItemsView.swift
//  Q-Plan it Calendar
//
//  Created by Izzy Bravo on 7/30/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct PlanitItemsView: View {
  @StateObject var viewModel : PlanItListViewModel
  @FirestoreQuery var items: [PlanItItem]
  init(userId: String) {
    self._items = FirestoreQuery(
      collectionPath: "user/\(userId)/todos"
    )
    self._viewModel = StateObject(
      wrappedValue: PlanItListViewModel(userId: userId)
    )
  }
  var body: some View {
    NavigationView {
      VStack {
        List(items) { item in
          PlanItItemView(item: item)
            .swipeActions {
              Button ("Delete") {
                viewModel.delete(id: item.id)
              }
              .tint(.red)
            }
        }
        ShareLink(item: "I am probably going to attend these events this week,check them out! \n1. Party - 08/04/2024 @ 11:47PM \n2. Watch Barbie Movie!08/04/2023 @ 7:30PM \n")
        .listStyle(PlainListStyle())
      }
      .navigationTitle("Plan it!")
      .toolbar {
        Button {
          viewModel.showingNewItemView = true
        } label: {
          Image(systemName: "plus")
        }
      }
      .sheet(isPresented: $viewModel.showingNewItemView) {
        NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }
    }
  }
}
struct PlanitItemsView_Previews: PreviewProvider {
  static var previews: some View {
    PlanitItemsView(userId: "7Y64keEfJ0S3bqGSVEX1SYeWaKy2")
  }
}
