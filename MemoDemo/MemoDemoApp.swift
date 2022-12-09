//
//  MemoDemoApp.swift
//  MemoDemo
//
//  Created by 유현재 on 2022/12/09.
//

import SwiftUI

@main
struct MemoDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // 처음 로딩 뷰
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
