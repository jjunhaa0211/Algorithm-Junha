//
//  File.swift
//  
//
//  Created by 박준하 on 5/12/24.
//

import UIKit
import Foundation

public extension Int {
    /// O(n) 걸립니다.
    func isPrimeNumberOn() -> Bool {
        
        if self < 2 {
            return false
        }
        
        for i in 2..<self {
            if self % i == 0 { return false }
        }
        
        return true
    }
    
    ///O(√n)
    func isPrimeNumberLogN() -> Bool {
        if self < 2 {
            return false
        }
        for i in 2..<Int(sqrt(Double(self)) + 1) {
            if self % i == 0 { return false }
        }
        return true
    }
    
    /// O(n * log(log n))
    /// 에라토스네의 체
    func sieveOfEratosthenes() -> [Int] {
        var isPrimeNumber = [Bool](repeating: true, count: self + 1)
        var primes = [Int]()

        isPrimeNumber[0] = false
        isPrimeNumber[1] = false

        for i in 2..<Int(sqrt(Double(self)) + 1) {
            if isPrimeNumber[i] {
                var j = 2
                while i * j <= self {
                    isPrimeNumber[i * j] = false
                    j += 1
                }
            }
        }

        for i in 1...self {
            if isPrimeNumber[i] {
                primes.append(i)
            }
        }

        return primes
    }
}
