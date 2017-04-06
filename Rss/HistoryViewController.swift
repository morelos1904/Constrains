//
//  HistoryViewController.swift
//  Rss
//
//  Created by MCS on 3/30/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,HTMLDelegateProtocol {

    var art:Article = Article()
    var getContent:HtmlDownloader = HtmlDownloader()
    
    @IBOutlet var titleNew: UILabel!
    @IBOutlet var imageNew: UIImageView!
    @IBOutlet var textView: UITextView!

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        titleNew.text=art.title
        titleNew.sizeToFit()
        getContent.delegate = self
        getContent.getHTMLContent(url: art.url)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printHTML(page: Article) {
        
        DispatchQueue.main.async(){
            self.textView.text=page.text
        }
        if (!page.img.isEmpty &&  page.img.hasPrefix("http") ){
            self.imageNew.downloadImageFrom(url:URL(string:page.img)!)
            print(self.imageNew.frame.size)
        }else{
            let linkImg = "https:"+self.art.img
            self.imageNew.downloadImageFrom(url:URL(string:linkImg)!)
            print(self.imageNew.frame.size)
        }
    }
}
