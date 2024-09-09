//
//  ListViewModel.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Watch a iOS video", isCompleted: true),
            ItemModel(title: "Let me brush up my skills", isCompleted: false),
            ItemModel(title: "Start studying for exams", isCompleted: false),
            ItemModel(title: "Have lunch", isCompleted: true)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
}
