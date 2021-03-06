//
//  HeroesTableViewController.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {

    var heroes: [Hero] = []
    var name: String?
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    var loadingHeroes: Bool = false
    var currentPage: Int = 0
    var total = 0
    var heroesLoading = true

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()
    }

    func loadHeroes() {
        loadingHeroes = true
        MarvelAPI.loadHeroes() { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroVC
        vc.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell

        let hero = heroes[indexPath.row]
        cell.prepareHero(with: hero)
        heroesLoading = false
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }
    
    func isHeroesLoading (loading:Bool) {
         DispatchQueue.main.async {
        if loading == true {
            self.isHeroesLoading(loading: loading)
            }
        }
    }

}
