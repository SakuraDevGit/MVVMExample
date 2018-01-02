//
//  HiraganaTableViewCell.swift
//  MVVMExample
//
//  Created by Rudi on 2/1/18.
//  Copyright © 2018 SakuraDev. All rights reserved.
//

import UIKit

class HiraganaTableViewCell: UITableViewCell {

    @IBOutlet weak var hiraganaLabel: UILabel!
    @IBOutlet weak var romanjiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setHiraganaToShow(hiragana: Hiragana) {
        hiraganaLabel.text = hiragana.character
        romanjiLabel.text = hiragana.romanji
    }
}
