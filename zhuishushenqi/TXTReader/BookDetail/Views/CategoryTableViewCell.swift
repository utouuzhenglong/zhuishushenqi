//
//  CategoryTableViewCell.swift
//  PageViewController
//
//  Created by Nory Cao on 16/10/11.
//  Copyright © 2016年 QS. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate {
    func downloadBtnClicked(sender:Any) -> Void;
}

class CategoryTableViewCell: UITableViewCell {
    
    var cellDelegate:CategoryCellDelegate?
    @IBOutlet weak var head: UIView!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var downloadBtn: UIButton!
    
    
    @IBAction func downloadAction(_ sender: Any) {
        cellDelegate?.downloadBtnClicked(sender: sender)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(model:[String:Any],chapterDict:[String:Any]){
        if let link = model["link"] as? String {
            if let _ = chapterDict[link] as? QSChapter {
                downloadBtn.isEnabled = false
                downloadBtn.setTitle("已缓存", for: .normal)
            } else {
                downloadBtn.isEnabled = true
                downloadBtn.setTitle("下载", for: .normal)
            }
        }
    }
    
    override func prepareForReuse() {
        tittle.textColor = UIColor.black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
