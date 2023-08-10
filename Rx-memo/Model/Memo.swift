//
//  Memo.swift
//  Rx-memo
//
//  Created by 박경준 on 2023/08/10.
//

import Foundation

struct Memo: Equatable{
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()){
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(self.insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
}
