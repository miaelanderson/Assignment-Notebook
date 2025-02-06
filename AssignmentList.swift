//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Mia Anderson on 1/31/25.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items : [AssignmentItem] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try?
                JSONDecoder().decode([AssignmentItem].self, from: data) {
                self.items = decodedData
                return
            }
        }
        items = []
    }
}
