//
//  ViewController.swift
//  MusicGgrabber
//
//  Created by Mirza Ahmed Baig on 11/05/18.
//  Copyright © 2018 MAB. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = movieNames[indexPath.row]
        return cell
    }
    
    
    var movieNames:[String] = []
    var movieNamesURLs:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for alphabet in UnicodeScalar("a").value...UnicodeScalar("z").value{
            
            DispatchQueue.main.async {
                print("Alpahbedt is \(String(UnicodeScalar(alphabet)!))")
                if let url = URL(string: "https://www.songsmp3.io/1/bollywood-music/list-\(String(UnicodeScalar(alphabet)!)).html") {
                    do {
                        let contents = try String(contentsOf: url)
                        let doc: Document = try SwiftSoup.parse(contents) // parse html
                        let document = try doc.select("div.list_inside_box")
                        for row in try! document.select("a") {
                            //                        movieNames.append(try row.text())
                            self.movieNamesURLs.append(try ("https://www.songsmp3.io"+row.attr("href")))
                            print(try ("https://www.songsmp3.io"+row.attr("href")))
                        }
                        //                    table.reloadData()
                    } catch {
                        print("Exception occure")
                    }
                } else {
                    print("else part")
                }
            }
            
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

