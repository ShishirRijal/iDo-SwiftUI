//
//  ItemModel.swift
//  iDo
//
//  Created by Shishir Rijal on 09/09/2024.
//

import Foundation

struct ItemModel:Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
