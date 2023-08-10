//
//  MemoryStorage.swift
//  Rx-memo
//
//  Created by 박경준 on 2023/08/10.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType{
    private var list = [
        Memo(content: "메모 1", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "메모 2")
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> RxSwift.Observable<Memo> {
        let newMemo = Memo(content: content)
        list.insert(newMemo, at: 0)
        
        store.onNext(list)
        
        return Observable<Memo>.just(newMemo)
    }
    
    @discardableResult
    func memoList() -> RxSwift.Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> RxSwift.Observable<Memo> {
        let updatedMemo = Memo(original: memo, updatedContent: content)
        
        if let firstIndex = list.firstIndex(where: { $0 == memo }){
            list.remove(at: firstIndex)
            list.insert(updatedMemo, at: firstIndex)
        }
        
        store.onNext(list)
        
        return Observable<Memo>.just(updatedMemo)
    }
    
    @discardableResult
    func delete(memo: Memo) -> RxSwift.Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }){
            list.remove(at: index)
        }
        store.onNext(list)
        
        return Observable<Memo>.just(memo)
    }
    
    
}
