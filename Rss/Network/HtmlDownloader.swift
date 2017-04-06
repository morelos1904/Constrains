//
//  HtmlDownloader.swift
//  
//
//  Created by MCS on 3/30/17.
//
//

import UIKit
import SwiftSoup


protocol HTMLDelegateProtocol {
    func printHTML (page: Article)
}

class HtmlDownloader: NSObject {
    
    var delegate:HTMLDelegateProtocol?
    func getHTMLContent(url: String){

        //Choose the correct URL
//        let urlReplace=url.replacingOccurrences(of: "http://", with: "https://")
//        print(urlReplace)
        let urlP =  URL(string: url)
        
        var urlRequest = URLRequest(url: urlP!)
        urlRequest.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            data, response, error in
            
            do{
                if let data = data {
                    let dataString  = String(describing: NSString(data: data, encoding: String.Encoding.utf8.rawValue)!)
                 
                    do{
                        let doc: Document = try SwiftSoup.parse(dataString)
                        let body: Element = try! doc.select("body").first()!
                        let link: Element = try! body.select("img").first()!
                        let image = try! link.attr("src")
                        let texto:String = try body.text()
                        self.delegate?.printHTML(page: Article(titleNews: "", imageNew: image, description: texto, webSite: url))
                    }catch Exception.Error( _, _)
                    {
                    }
                }
            }catch{
                print("error trying to convert data to JSON")
                return
            }
        })
        task.resume()
    }

    
}
