//
//  AddTaskView.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText:String = ""
    @State var showAlert: Bool = false
    
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
                
                Button(action: save, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func textIsAppropriate() -> Bool {
        if(textFieldText.count < 4) {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func save() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        else {
            
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Task must be 4 characters or long! 🧐"))
    }
    
    
    
}

#Preview {
    NavigationView {
        AddTaskView()
            .environmentObject(ListViewModel())
    }
}
