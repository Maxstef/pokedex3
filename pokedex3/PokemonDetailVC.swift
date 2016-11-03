//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Maurice on 02.11.16.
//  Copyright © 2016 Maurice. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    @IBOutlet weak var imagePok: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokeIdLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var evoImg: UIImageView!
    @IBOutlet weak var currentImg: UIImageView!
    
    var pokemon: Pokemon!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalized
        imagePok.image = UIImage(named: "\(self.pokemon.pokedexId)")
        currentImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        pokeIdLbl.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetails {
            // called after network call complete
            self.updateUI()
            
        }

    }
    
    func updateUI(){
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descLbl.text = pokemon.desc
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolution"
            evoImg.isHidden = true
        } else {
            evoImg.isHidden = false
            evoImg.image = UIImage(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }

    
    @IBAction func backPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

}
