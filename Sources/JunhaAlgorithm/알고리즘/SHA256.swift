//
//  File.swift
//  
//
//  Created by 박준하 on 5/6/24.
//

import UIKit
import Foundation
import CryptoKit

public extension String {
    mutating func SHA256Print() {
        let data = self.data(using: .utf8)
        let sha256 = SHA256.hash(data: data!)
        let stringHash = sha256.compactMap { String(format: "%02x", $0)}.joined()
        print("해시 전의 값: \(self)")
        print("해시 후의 값: \(stringHash)")
    }
}
