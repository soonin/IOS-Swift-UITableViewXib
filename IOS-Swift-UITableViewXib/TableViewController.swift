//
//  TableViewController.swift
//  IOS-Swift-UITableViewXib
//
//  Created by Pooya on 2018-10-08.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit


struct BookList {
    var bookName : String
    var bookType : String
    var bookDes : String
    var bookImage : String
    
    init(bookName: String, bookType: String, bookDes: String, bookImage: String) {
        self.bookName = bookName
        self.bookType = bookType
        self.bookDes = bookDes
        self.bookImage = bookImage
    }
    
    init(){
        self.bookName = ""
        self.bookType = ""
        self.bookDes = ""
        self.bookImage = ""
    }
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [BookList] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableArray = preLoadFromPlist(forResource: "sheetData", ofType: "plist")
        print(tableArray)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
    }
    

    // pre-load data from plist for Books
    func preLoadFromPlist(forResource: String, ofType: String) -> [BookList] {
        var preLoadcounter : Int = 0
        var localArray : [BookList] = []
        
        // mak path from Plist File
        if let path = Bundle.main.path(forResource: forResource, ofType: ofType),
            
            // get dictionay via path
            let myDict = NSDictionary(contentsOfFile: path){
            
            //now start to Use myDict here
            //print(myDict["locations"])
            for (key, value) in (myDict["books"] as? [String:Any])! {
                //print("For: \(key) ::")
                
                // here we are expecting LocationName , lat and lon
                var oneBook : BookList = BookList()
                for (locKey, locVal) in (value as? [String:Any])! {
                    print("Key: \(locKey) - Value: \(locVal)")
                    switch locKey {
                        case "name":
                            oneBook.bookName = locVal as! String
                        case "type":
                            oneBook.bookType = locVal as! String
                        case "description":
                            oneBook.bookDes = locVal as! String
                        case "imageName":
                            oneBook.bookImage = locVal as! String
                        default :
                            oneBook.bookDes += locVal as! String
                    }
                }
                // add conter in case of sucssesful save
                preLoadcounter += 1
                //print(oneBook)
                localArray.append(oneBook)
            }
        }
        return localArray
    } // End of preLoadFromPlist(forResource: String, ofType: String)

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        let oneBook = tableArray[indexPath.row]
        cell.cellInit(col01: oneBook.bookName, col02: oneBook.bookType, col03: oneBook.bookDes, iconName: oneBook.bookImage)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailInit(title: tableArray[indexPath.row].bookName,
                      type: tableArray[indexPath.row].bookType,
                      detail: tableArray[indexPath.row].bookDes,
                      iconName: tableArray[indexPath.row].bookImage)
        self.navigationController?.pushViewController(vc, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/8
    }
    
}
