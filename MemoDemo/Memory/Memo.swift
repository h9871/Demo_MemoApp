//
//  Memo.swift
//  MemoDemo
//
//  Created by 유현재 on 2022/12/09.
//

import Foundation
import SwiftUI

/*
 
 Published
 */

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
}
