//
//  FetchXML.swift
//  DallasRE
//
//  Created by Yu Zhang on 8/13/19.
//  Copyright © 2019 Yu Zhang. All rights reserved.
//
/*Sample call
 Below is an example of calling the API for the address for the exact address match "2114 Bigelow Ave", "Seattle, WA":
 http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=<ZWSID>&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA
 */

import Foundation

let searchUrlBase = "http://www.zillow.com/webservice/GetSearchResults.htm?"
let zwid = "X1-ZWz1gwaj4yd6ob_5upah"
var urlstring = ""

class FetchXML {
    static func searchResult(address: String, city: String, state: String, zipCode: String? = nil) {
        let trimmedAdress = address.trimmingCharacters(in: CharacterSet.whitespaces)
        let formatAddress = trimmedAdress.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)

        if zipCode == nil {
            urlstring = searchUrlBase + "zws-id=\(zwid)" + "&\(formatAddress)" + "&\(city)" + "&\(state)"
            
        } else {
            guard let zip = zipCode else {return}
            urlstring = searchUrlBase + "zws-id=\(zwid)" + "&\(formatAddress)" + "&\(zip)"
        }
        guard let url = URL(string: urlstring) else {return}
        URLSession.shared.dataTask(with: url) {data,response,error in
            
        }
    }

    
    
}

