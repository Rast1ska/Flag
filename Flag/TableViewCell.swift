//
//  TableViewCell.swift
//  Flag
//
//  Created by Ильфат Салахов on 19.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var nameCountryLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(flag: String) {
        flagImageView.image = UIImage(named: flag)
        nameCountryLabel.text = flag.uppercased()
    }
}
