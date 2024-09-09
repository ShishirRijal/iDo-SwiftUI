//
//  AddTaskView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct AddTaskView: View {
    
    @State var textFieldText:String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Write a new task...",
                text: $textFieldText
                )
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemFill))
            .cornerRadius(10)
            
                Spacer()
                        .frame(height: 50)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add New Task")
    }
}

#Preview {
    NavigationView {
        AddTaskView()
    }
}
