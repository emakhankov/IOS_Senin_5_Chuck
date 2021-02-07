//
//  Model.swift
//  IOS_Senin_5_Chuck
//
//  Created by Jenya on 07.02.2021.
//

import Foundation

func getRandomJoke() -> String {
    
    let urlString = "http://api.icndb.com/jokes/random"
    
    let url = URL(string: urlString)
    
    do {
        let dataJson = try Data(contentsOf: url!)
        
        let jsonDictionary = try JSONSerialization.jsonObject(with: dataJson, options: .allowFragments) as! NSDictionary
        
        let value = jsonDictionary.object(forKey: "value") as! NSDictionary
        
        return value.object(forKey: "joke") as! String
        
    } catch {
        print(error)
    }
    return ""
}
