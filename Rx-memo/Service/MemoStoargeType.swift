//
//  MemoStoargeType.swift
//  Rx-memo
//
//  Created by 박경준 on 2023/08/10.
//

import Foundation
import RxSwift


protocol MemoStorageType{
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
