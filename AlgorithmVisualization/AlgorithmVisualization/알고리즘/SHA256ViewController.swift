//
//  SHA256ViewController.swift
//  AlgorithmVisualization
//
//  Created by 박준하 on 5/6/24.
//

import UIKit
import JunhaAlgorithm

public class SHA256ViewController: UIViewController {
    
    var junhaText = "junha"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        junhaText.SHA256Print()
    }
}
