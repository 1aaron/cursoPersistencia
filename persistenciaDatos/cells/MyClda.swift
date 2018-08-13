//
//  MyClda.swift
//  persistenciaDatos
//
//  Created by Developer on 8/13/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit

class MyClda: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setName(name: String, lastName: String){
        lblName.text = name
        lblLastName.text = lastName
    }

}
