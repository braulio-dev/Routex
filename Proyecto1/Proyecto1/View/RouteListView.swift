//
//  SwiftUIView.swift
//  Proyecto1
//
//  Created by CETYS Universidad  on 19/02/25.
//

import SwiftUI

struct RouteListView: View {
    
    @ObservedObject private var viewModel =  RouteViewModel()
     
    var body: some View {
        NavigationView {
            
            // Add a List here to show MoodEntry items
            List {
                // Each row should use MoodRowView
                ForEach(viewModel.routes) { entry in
                }
                
            }
            .navigationTitle("Routes")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing){
//                    Button(action: {
//                        showAddMoodView = true
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarLeading){
//                    EditButton()
//                }
//            }
//            .sheet(isPresented: $showAddMoodView) {
//                AddMoodView(viewModel: viewModel)
//            }
        }
    }
}

#Preview {
    RouteListView()
}
