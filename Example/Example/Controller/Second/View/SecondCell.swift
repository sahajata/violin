//
//  SecondCell.swift
//  Example
//
//  Created by liuzhiyi on 2018/9/18.
//  Copyright © 2018年 Karma. All rights reserved.
//

import Violin
import UIKit
import Kingfisher

class SecondCell: UITableViewCell {

    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    public var model: ViewLawyerCustomer? {
        didSet {
            let url = URL(string: "http://192.168.1.152/\(model?.customer?.imageUrl ?? "")")
            headImage.kf.setImage(with: url, placeholder: Image(named: "head_image"))
            name.text = model?.customer?.nickname
        }
    }
    
}
