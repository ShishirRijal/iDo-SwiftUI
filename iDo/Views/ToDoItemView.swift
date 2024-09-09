//
//  ToDoItemView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct ToDoItemView: View {
    let item: ItemModel
    
    
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green: .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}
#Preview (traits: .sizeThatFitsLayout) {
    Group {

            ToDoItemView(item: ItemModel(title: "This is the first item", isCompleted: false))
            ToDoItemView(item: ItemModel(title: "This is the second item", isCompleted: true))

    }
}
