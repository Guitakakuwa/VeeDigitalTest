//
//  MarvelAPI.swift
//  VeeQuizMarvel
//
//  Created by Guilherme Takakuwa on 3/22/19.
//  Copyright © 2019 Guilherme Takakuwa. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    static let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static let privateKey = "c4cc055e3f7668521cf813b4489d2ea791a17b8a"
    static let publicKey = "26a2b99fb1cde83f61e79d53c65803ba"
    static private let limit = 50
    
    class func loadHeroes(name: String?, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))"
        } else {
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(marvelInfo)
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
}
