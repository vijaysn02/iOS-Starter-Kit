//
//  ViewController.swift
//  TableView Starter
//
//  Created by Digital Testing on 08/10/19.
//  Copyright © 2019 VIjay. All rights reserved.
//

import UIKit

//MARK: - View Controller
class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTableViewSetup()
    }

}

//MARK: - Initial View Setup
extension ViewController {
    func initialTableViewSetup() {
        self.tableView.register(UINib(nibName: TableViewConstants.nibName, bundle: nil), forCellReuseIdentifier: TableViewConstants.cellReUseIdentifier)
        
        tableView.backgroundColor = TableViewConstants.backgroundColor
        tableView.delegate = self
        tableView.dataSource = self
    }
}


//MARK: - Table View Datasource / Delegate
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResponseSample.ResponseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.cellReUseIdentifier,for: indexPath) as! CustomTableCell
    
        cell.iconImageVieww.image = ResponseSample.ResponseData[indexPath.row].image
        cell.titleLabel.text = ResponseSample.ResponseData[indexPath.row].title
        cell.descriptionLabel.text = ResponseSample.ResponseData[indexPath.row].description
        
        cell.statusLabel.text = ResponseSample.ResponseData[indexPath.row].status
        cell.backgroundColor = UIColor.clear
        
        return cell
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row is selected \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConstants.tableHeight
    }
    
}



//MARK: - Constants
struct TableViewConstants {
    static let cellReUseIdentifier = "CustomCell"
    static let nibName = "TableCell_Template"
    static let backgroundColor = UIColor(red: 36.0 / 255.0, green: 42.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
    static let tableHeight = UIScreen.main.bounds.height / 8
}

//MARK: - Response Sample and Model
struct ResponseModel {
    let image:UIImage
    let title:String
    let description:String
    let status:String
}

struct ResponseSample {
    static let ResponseData = [ResponseModel(image: UIImage(named: "avatar_1")!, title: "Title_1", description: "Description_1", status: "Status_1"),ResponseModel(image: UIImage(named: "avatar_2")!, title: "Title_2", description: "Description_2", status: "Status_2"),ResponseModel(image: UIImage(named: "avatar_3")!, title: "Title_3", description: "Description_3", status: "Status_3"),ResponseModel(image: UIImage(named: "avatar_4")!, title: "Title_4", description: "Description_4", status: "Status_4"),ResponseModel(image: UIImage(named: "avatar_5")!, title: "Title_5", description: "Description_5", status: "Status_5"),ResponseModel(image: UIImage(named: "avatar_6")!, title: "Title_6", description: "Description_6", status: "Status_6"),ResponseModel(image: UIImage(named: "avatar_7")!, title: "Title_7", description: "Description_7", status: "Status_7"),ResponseModel(image: UIImage(named: "avatar_8")!, title: "Title_8", description: "Description_8", status: "Status_8"),ResponseModel(image: UIImage(named: "avatar_9")!, title: "Title_9", description: "Description_9", status: "Status_9")]
}

//MARK: - Helper
class WhiteLabel:UILabel {
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setUpText()
    }
    func setUpText() {
        self.font = UIFont(name: "Helvetica-Neue-Medium", size: 16)
        self.textColor = UIColor.white
        self.backgroundColor = UIColor.clear
    }
}
class WhiteLabel_Small:WhiteLabel {
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setUpFont()
    }
    func setUpFont() {
        self.font = UIFont(name: "Helvetica-Neue-Medium", size: 12)
    }
}
class GreyLabel:WhiteLabel_Small {
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setUpColor()
    }
    func setUpColor() {
        self.textColor = UIColor.gray
    }
}
