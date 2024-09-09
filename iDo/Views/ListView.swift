//
//  ListView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
    "There's one thing!",
    "Let me brush up my skills",
    "Start EES",
    ]
    
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ToDoItemView(title: item)
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


