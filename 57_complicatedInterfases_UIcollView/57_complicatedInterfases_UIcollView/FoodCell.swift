//
//  FoodCell.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 06.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit

//MARK: - cell number two

class FoodCell: UICollectionViewCell , SelfConfiguringCell  {
    
    static var reuseId: String = "FoodCell"
    let friendImageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstrains()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func setupConstrains() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        //addSubview(label)
        label.frame = self.bounds
        label.text = " Food "
        backgroundColor = .systemTeal
        
    }
    func configure(with intValue: Int) {
        label.text = String(intValue)
    }
    
     required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
