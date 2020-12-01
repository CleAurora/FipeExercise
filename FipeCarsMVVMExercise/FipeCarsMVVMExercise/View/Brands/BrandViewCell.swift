//
//  BrandViewCell.swift
//  FipeCarsMVVMExercise
//
//  Created by Cleís Aurora Pereira on 30/11/20.
//

import UIKit

class BrandViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    func setup(brand: Brand) {
        nameLabel.text = brand.name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
