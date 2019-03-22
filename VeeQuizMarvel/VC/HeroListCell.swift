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
    
    @IBOutlet var dataModificacao: UILabel!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var descHero: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        
    }
    //
    func prepareHero(with hero: Hero) {
        nameHero.text = hero.name
        descHero.text = hero.description
        dataModificacao.text = hero.modified
        if let url = URL(string: hero.thumbnail.url) {
            imageHero.kf.setImage(with: url)
        } else {
            imageHero.image = nil
        }
        
        //Transformação da imagem em circulo
        imageHero.layer.cornerRadius = imageHero.frame.size.height / 2
        imageHero.layer.borderColor = UIColor.red.cgColor
        imageHero.layer.borderWidth = 2
        
    }
    
}
