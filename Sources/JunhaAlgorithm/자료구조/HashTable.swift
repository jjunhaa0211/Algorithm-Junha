//
//  File.swift
//  
//
//  Created by 박준하 on 5/6/24.
//

import Foundation

public struct HashTable {
    // 해시 테이블에서 데이터를 저장할 배열입니다. 각 위치에는 문자열이 저장될 수 있으며, 값이 없는 경우 nil로 표시됩니다.
    private var table: [String?]
    private let capacity: Int

    /// 초기화 함수입니다. 해시 테이블의 최대 용량을 설정하고, 모든 위치를 nil로 초기화합니다.
    /// - Parameter capacity: 해시 테이블의 최대 용량입니다.
    public init(capacity: Int) {
        self.capacity = capacity
        self.table = .init(repeating: nil, count: capacity)
    }

    /// 주어진 키를 해싱하여 적절한 해시 주소를 계산하는 함수입니다.
    /// - Parameter key: 해싱할 키입니다.
    /// - Returns: 계산된 해시 주소입니다.
    private func hash(key: Int) -> Int {
        return key % capacity
    }

    /// 해시 테이블에 새로운 값과 키를 추가하거나, 기존 키의 값을 업데이트하는 함수입니다.
    /// - Parameters:
    ///   - value: 저장할 문자열 값입니다.
    ///   - key: 값과 연결될 키입니다.
    mutating public func updateValue(_ value: String, forKey key: String) {
        guard let key = UnicodeScalar(key)?.value else { return }
        let hashAddress = hash(key: Int(key))
        table[hashAddress] = value
    }

    /// 주어진 키에 해당하는 값을 해시 테이블에서 찾아 반환하는 함수입니다.
    /// - Parameter key: 찾고자 하는 값의 키입니다.
    /// - Returns: 키에 해당하는 값이 있으면 그 값을, 없으면 nil을 반환합니다.
    mutating public func getValue(forKey key: String) -> String? {
        guard let key = UnicodeScalar(key)?.value else { return nil }
        let hashAddress = hash(key: Int(key))
        return table[hashAddress]
    }
}
