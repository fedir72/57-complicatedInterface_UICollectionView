//
//  SelfConfiguringCell_Protocol.swift
//  57_complicatedInterfases_UIcollView
//
//  Created by fedir on 06.08.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with intValue: Int)
}
