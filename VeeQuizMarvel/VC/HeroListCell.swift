//
//  HeroListCell.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        
    }
    //
    func prepareHero(with hero: Hero) {
        lbName.text = hero.name
        lbDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.url) {
            ivThumb.kf.setImage(with: url)
        } else {
            ivThumb.image = nil
        }
        
        //Transformação da imagem em circulo
//        ivThumb.layer.cornerRadius = ivThumb.frame.size.height / 2
//        ivThumb.layer.borderColor = UIColor.red.cgColor
//        ivThumb.layer.borderWidth = 2
        
    }
    
}
