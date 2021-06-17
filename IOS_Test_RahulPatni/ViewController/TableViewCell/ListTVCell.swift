//
//  ListTVCell.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import UIKit

class ListTVCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(data: Product) {
        self.lblTitle.text = "\(data.product_name ?? "")".capitalized
        self.imgView?.setImageFromURl("\(data.product_Image ?? "")")
    }
}
