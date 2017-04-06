//
//  ViewController.swift
//  Rss
//
//  Created by MCS on 3/29/17.
//  Copyright © 2017 com.mobileconsultingsolutions. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableNews: UITableView!
    var items:[Article]=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let par = NetworkManager()
        items=par.beginParsing()
          
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        
        cell.lbl.text=items[indexPath.row].title
        cell.lbl.sizeToFit()
        cell.content.text=items[indexPath.row].text
        cell.content.sizeToFit()
        let url = "https:" + items[indexPath.row].img
        cell.img.downloadImageFrom(url:URL(string:url)!)
        return cell 
    }
    

     func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath)->IndexPath?{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "History") as! HistoryViewController
        controller.art = items[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        return indexPath
    }


    
}

