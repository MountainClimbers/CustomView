//
//  TableViewCell.swift
//  CustomView
//
//  Created by qj.huang on 2018/6/14.
//  Copyright © 2018年 qjmac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    var txtLbl:UILabel!
    var imgVi:UIImageView!
    var lineVi:UIView!
    
    func setUpUI() {
        txtLbl = UILabel.init(frame: CGRect.init(x: 12, y: (self.frame.size.height - 21) / 2.0, width: 200, height: 21))
        self.addSubview(txtLbl)
        
        imgVi = UIImageView.init(frame: CGRect.init(x: self.frame.size.width - 12 - 14, y: (self.frame.size.height - 14) / 2.0, width: 14, height: 14))
        imgVi.backgroundColor = UIColor.red
        self.addSubview(imgVi)
        
        lineVi = UIView.init(frame: CGRect.init(x: 0, y: self.frame.size.height - 0.5, width: self.frame.size.width, height: 0.5))
        lineVi.backgroundColor = UIColor.lightGray
        self.addSubview(lineVi)
    }
    
    func setCell(txt:String) {
        txtLbl.text = txt
    }
}
