//
//  CustomTableCell.swift
//  TableView Starter
//
//  Created by Digital Testing on 08/10/19.
//  Copyright © 2019 VIjay. All rights reserved.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet weak var iconImageVieww: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
