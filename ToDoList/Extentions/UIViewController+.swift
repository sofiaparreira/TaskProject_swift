//
//  UIViewController+.swift
//  ToDoList
//
//  Created by Sofia on 16/07/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    //gradiente da cor do fundo
    func addGradientBackground() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilac)?.cgColor ?? UIColor.purple.cgColor]
        
        view.layer.insertSublayer(gradientBackground, at: 0)
    }
}
