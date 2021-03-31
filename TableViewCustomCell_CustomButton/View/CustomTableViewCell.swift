//
//  CustomTableViewCell.swift
//  TableViewCustomCell_CustomButton
//
//  Created by 김동환 on 2021/03/30.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var heartBtn: CustomHeartBtn!
    
    var heartBtnTapped: ((Bool) -> Void)?
    
    var isFavorite: Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.heartBtn.addTarget(self, action: #selector(heartBtnClicked), for: .touchUpInside)
        
    }
    
    func updateCell(with feed: Feed) {
        
        contentLabel.text = feed.content
        heartBtn.configHeart(with: feed.isFavorite)
        self.isFavorite = feed.isFavorite
    }
    
    @objc func heartBtnClicked(){
        
        self.isFavorite.toggle()
        heartBtnTapped?(self.isFavorite)
        heartBtn.changeHeartBtn(self.isFavorite)
        
    }
}
