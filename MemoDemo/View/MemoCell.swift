//
//  MemoCell.swift
//  MemoDemo
//
//  Created by 유현재 on 2022/12/09.
//

import SwiftUI

struct MemoCell: View {
    /*
     파라미터
     */
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Dummy"))
    }
}
