//
//  CustomHeartBtn.swift
//  TableViewCustomCell_CustomButton
//
//  Created by 김동환 on 2021/03/30.
//

import UIKit

class CustomHeartBtn: UIButton {
    
    var isActivated: Bool = false
    
    let favoriteImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
    let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8038416505, green: 0.8039775491, blue: 0.8038237691, alpha: 1)).withRenderingMode(.alwaysOriginal)
  
    
    func configHeart(with isFavorite: Bool){
        
        self.isActivated = isFavorite
        
        self.setImage(self.isActivated ? favoriteImage : normalImage, for: .normal)
        
    }
    
    func changeHeartBtn(_ isFavorite: Bool){
        self.isActivated = isFavorite
        animate()
    }
    
    fileprivate func animate(){
        
        UIView.animate(withDuration: 0.1) {
            [weak self] in
            
            guard let self = self else { return }
            
            let newImage = self.isActivated ? self.favoriteImage : self.normalImage
            
            //1.크기 줄이기
            
            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
            self.setImage(newImage, for: .normal)
            
            
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        }

        
    }
    
}
