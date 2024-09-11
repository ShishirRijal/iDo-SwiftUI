//
//  ListView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

        
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                Text("No items added yet!")
                    .font(.title)
            }
            List {
                ForEach(listViewModel.items) { item in
                    ToDoItemView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
        }.listStyle(.plain)
        .navigationTitle("ToDo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTaskView())
        
        )
    }

}

#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}


