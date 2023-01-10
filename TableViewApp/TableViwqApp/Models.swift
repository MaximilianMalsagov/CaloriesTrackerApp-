//
//  Models.swift
//  TableViwqApp
//
//  Created by Maximilian on 07.01.2023.
//

import Foundation

enum CellModel {
    case collectionView(models: [CollectionTableCellModel],rows: Int)
    case list(models: [ListCellModel])
}

struct ListCellModel {
    let title: String
}

struct CollectionTableCellModel {
    let title: String
    let imageName: String
}
