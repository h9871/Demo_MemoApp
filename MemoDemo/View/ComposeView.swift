//
//  ComposeView.swift
//  MemoDemo
//
//  Created by 유현재 on 2022/12/09.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    // 메모가 전달되면 편집모드, 없으면 쓰기모드
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    // 바인딩
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // To A 바인딩
                TextEditor(text: $content)
                    .padding()
                    .onAppear {
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
