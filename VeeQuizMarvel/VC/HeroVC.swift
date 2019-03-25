//
//  HeroVC.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import Foundation
import WebKit

class HeroVC:UIViewController {

  
    @IBAction func goBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil )
    }
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDesc: UILabel!
    var hero: Hero!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInfo()
    }
    
    func fillInfo(){
        heroName.text = hero.name
        if hero.description.isEmpty == false {
            heroDesc.text = hero.description
        } else {
            heroDesc.text = "Descrição não disponivel"
        }
        if let url = URL(string: hero.thumbnail.url) {
            profileImage.kf.setImage(with: url)
        } else {
            profileImage.image = nil
        }
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layer.borderColor = UIColor.red.cgColor
        profileImage.layer.borderWidth = 2
    }
}






