//
//  ParserRss.swift
//  Rss
//
//  Created by MCS on 3/30/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import Foundation
import SwiftSoup

class ParserRss {
    
    static func getFirstNew (texto:String)->Article{
        var result:Article = Article()
        do{
            let doc: Document = try SwiftSoup.parse(texto)
            let link: Element = try! doc.select("img").first()!
            let image = try! link.attr("src")
            let textNew = try doc.text()
            let url=getUrl(text: texto)
            result=Article(titleNews: "", imageNew: image, description: textNew, webSite: url);
        }catch Exception.Error( _, _)
        {
        }catch{
        }
        return result
    }
    
    static func getUrl (text:String)->String{

        var result = ""
        let rangeUrl = text.range(of: ";url=",
                                options: NSString.CompareOptions.literal,
                                range: text.startIndex..<text.endIndex,
                                locale: nil)

        if let range = rangeUrl {
            let intUrl = text.distance(from: text.startIndex, to: range.lowerBound)
            let resultFin = text.range(of: ">",
                                       options: NSString.CompareOptions.literal,
                                       range: range.lowerBound..<text.endIndex,
                                       locale: nil)
            
            if let rangeFin = resultFin {
                let intImg = text.distance(from: text.startIndex, to: rangeFin.upperBound)
                let index = text.index(text.startIndex, offsetBy: intImg-2)
                   result=text.substring(to: index)
                    let index1 = text.index(text.startIndex, offsetBy: intUrl+5)
                   result=result.substring(from: index1)
              
            }
        }

        return result
    }

    static func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
        
    }
    
    
}
