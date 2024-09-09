//
//  ListView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
    ItemModel(title: "Watch a iOS video", isCompleted: true),
    ItemModel(title: "Let me brush up my skills", isCompleted: false),
    ItemModel(title: "Start studying for exams", isCompleted: false),
    ItemModel(title: "Have lunch", isCompleted: true)
]
    
    
    var body: some View {
        List {
            ForEach(items) { item in
                ToDoItemView(item: item)
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
    }
}


