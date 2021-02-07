//
//  ViewController.swift
//  IOS_Senin_5_Chuck
//
//  Created by Jenya on 07.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelJoke: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(getRandomJoke())
    }

    @IBAction func pushRefreshAction(_ sender: Any) {
        
        labelJoke.text = getRandomJoke()
    }
    
    @IBAction func pushShareAction(_ sender: Any) {
        
        if let jokeToShare = labelJoke?.text {
            let avc = UIActivityViewController(activityItems: [jokeToShare], applicationActivities: nil)
        }
        
        present(avc, animated: true, completion: nil)
    }
}

