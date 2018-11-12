//
//  DetailViewController.swift
//  IOS-Swift-UITableViewXib
//
//  Created by Pooya on 2018-10-08.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var detailView: UITextView!
    @IBOutlet weak var typeView: UILabel!
    var imageName : String!
    var titleName : String!
    var detailName : String!
    var typeName : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: self.imageName)
        titleView.text = titleName
        typeView.text = typeName
        detailView.text = detailName
    }


    func detailInit(title: String, type: String, detail:String, iconName:String){
//        self.titleView.text = title
//        self.typeView.text = type
//        self.detailView.text = detail
//        self.imageView.image = UIImage(named: iconName)
        self.imageName = iconName
        self.titleName = title
        self.typeName = type
        self.detailName = detail
        
        self.title = title
    }

}
