//
//  Coordinator.swift
//  mvvm-c-pattern-blog-app
//
//  Created by TanjilaNur-00115 on 3/12/24.
//

import UIKit

// Coordinator protocol
protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    var children: [Coordinator]? { get set }
        
    func start()
}
