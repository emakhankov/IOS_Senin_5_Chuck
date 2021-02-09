//
//  Model.swift
//  IOS_Senin_5_Chuck
//
//  Created by Jenya on 07.02.2021.
//

import Foundation

func getRandomJoke(block: (String)->Void) {
    
    let urlString = "http://api.icndb.com/jokes/random"
    
    let url = URL(string: urlString)
    
    do {
        let dataJson = try Data(contentsOf: url!)
        
        let jsonDictionary = try JSONSerialization.jsonObject(with: dataJson, options: .allowFragments) as! NSDictionary
        
        let value = jsonDictionary.object(forKey: "value") as! NSDictionary
        
        block((value.object(forKey: "joke") as! String).replacingOccurrences(of: "&quot;", with: "'"))
        return
        
    } catch {
        print(error)
    }
    
    block("")
}


var jokes: [String] {
    
    set {
        UserDefaults.standard.set(newValue, forKey: "jokes")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "jokes") {
            return array as! [String]
        } else {
            return []
        }
    }
    
}

func addJokeToFavorites(newJoke: String) {
    for j in jokes {
        if j==newJoke {
            return
        }
    }
    
    jokes.append(newJoke)
    
}
