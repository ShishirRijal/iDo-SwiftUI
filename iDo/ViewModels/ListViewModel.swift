//
//  ListViewModel.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        // it gets called everytime items is SET
        didSet {
            saveItems()
        }
    }
    let itemLists: String = "ITEM_LISTS"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "Watch a iOS video", isCompleted: true),
//            ItemModel(title: "Let me brush up my skills", isCompleted: false),
//            ItemModel(title: "Start studying for exams", isCompleted: false),
//            ItemModel(title: "Have lunch", isCompleted: true)
//        ]
//        items.append(contentsOf: newItems)
        guard let data = UserDefaults.standard.data(forKey: itemLists) else {return}
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        self.items = savedItems

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
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemLists)
        }
    }
    
}
