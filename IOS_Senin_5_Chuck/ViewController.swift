//
//  ViewController.swift
//  IOS_Senin_5_Chuck
//
//  Created by Jenya on 07.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelJoke: UILabel!
    
    @IBOutlet weak var buttonShare: UIBarButtonItem!
    
    @IBOutlet weak var buttonRefresh: UIBarButtonItem!
    
    @IBOutlet weak var buttonAddToFavorites: UIButton!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func pushRefreshAction(_ sender: Any) {
        
        buttonRefresh.isEnabled = false
        indicator.startAnimating()
        getRandomJoke { (joke) in
            
            DispatchQueue.main.async {
                
                self.labelJoke.text = joke
                self.indicator.stopAnimating()
                self.buttonRefresh.isEnabled = true
                self.buttonShare.isEnabled = true
                self.buttonAddToFavorites.isEnabled = true
                
            }
            
        }
    }
    
    @IBAction func pushShareAction(_ sender: Any) {
        
        
        
        if let jokeToShare = labelJoke?.text {
            let avc = UIActivityViewController(activityItems: [jokeToShare], applicationActivities: nil)
            present(avc, animated: true, completion: nil)
        }
        
        
    }
    @IBAction func pushAddToFavorites(_ sender: Any) {
        addJokeToFavorites(newJoke: labelJoke.text!)
    }
    
    
}

