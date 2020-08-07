//
//  UserCell.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 05.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit

//MARK: - cell number one


class UserCell: UICollectionViewCell,SelfConfiguringCell {
    
    static var reuseId: String = "UserCell"
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        setupConstrains()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func setupConstrains() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.backgroundColor = .systemPink
        addSubview(friendImageView)
        friendImageView.frame = self.bounds
        //backgroundColor = .green
        
    }
    func configure(with intValue: Int) {
        print("123")
    }
    
     required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
