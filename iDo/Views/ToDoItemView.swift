//
//  ToDoItemView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct ToDoItemView: View {
    let title:String
    let isCompleted:Bool = false
    
    
    
    var body: some View {
        HStack{
            Image(systemName: isCompleted ? "checkmark.circle": "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ToDoItemView(title: "ToDo1")
}
