//
//  NetworkManager.swift
//  Rss
//
//  Created by MCS on 3/29/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import UIKit
import SwiftSoup

class NetworkManager: NSObject,XMLParserDelegate {

    var parser = XMLParser()
    var elements = NSMutableDictionary()
    var element = ""
    var title1 = ""
    var desc = ""
    var posts:[Article] = []
    
    

    func  beginParsing() -> [Article]
    {
        let urlToSend:URL = URL(string:"https://pastebin.com/raw/kDxhMN9U")!
        parser = XMLParser(contentsOf: urlToSend)!
        parser.delegate = self
        parser.parse()
        return posts
    }
 
    // Each time that find a new element , it will run this method
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element=elementName
        if(element as NSString).isEqual(to: "item"){
            elements = [:]                      // Creates an new dictionary
            title1 = ""
            desc = ""
        }
    }
    
    // When find a new character in the string , it will run this method
    func parser(_ parser: XMLParser, foundCharacters string: String) {
       
        if element=="title"{
            title1=title1+string
        }
        if element=="description"{
            desc=desc+string
        }
    }
 
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        var result:Article=Article()
        
        if (elementName as NSString).isEqual(to: "item") {
            if !desc.isEqual(nil) {
                result=ParserRss.getFirstNew(texto: desc)
            }
            if !title1.isEqual(nil) {
                result.title=title1
            }
            posts.append(result)
        }
    }
    
}
