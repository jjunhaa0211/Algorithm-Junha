//
//  BinarySearchViewController.swift
//  AlgorithmVisualization
//
//  Created by 박준하 on 5/8/24.
//

import UIKit
import JunhaAlgorithm

class BinarySearchViewController: UIViewController {
    
    var arr: [Int] = [23, 87, 65, 12, 57, 32, 99, 81]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = arr.sorted()
        print(test)
        let a = test.binarySearch(num: 32)
        print(a ?? -1)
    }
}
