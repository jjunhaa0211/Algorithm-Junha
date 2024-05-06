//
//  HashTableViewController.swift
//  AlgorithmVisualization
//
//  Created by 박준하 on 5/6/24.
//

import UIKit
import JunhaAlgorithm

public class HashTableViewController: UIViewController {
    
    var hashTable = HashTable(capacity: 3)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        hashTable.updateValue("박", forKey: "준하")
        hashTable.updateValue("팍", forKey: "쭈나")
        hashTable.updateValue("빡", forKey: "주우나")

        if let value = hashTable.getValue(forKey: "준하") {
            print("키 A에 대한 값: \(value)")
        } else {
            print("키 A에 대한 값이 없습니다.")
        }
        
        view.backgroundColor = .red
    }
}
