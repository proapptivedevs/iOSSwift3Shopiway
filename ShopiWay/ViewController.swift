//
//  ViewController.swift
//  ShopiWay
//
//  Created by Jaismeen Sandhu (300877728) on 2017-02-21.
//  Purpose : To Add Data to table and Have Buttons Controls
//  Copyright © 2017 proapptive. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // List Items Data and Quantity Declaration
    var data:[String]=["New Car","Milk","Salt","Cucumber","NoteBooks"]
    var quantityCell:[String]=["1","2","1","6","5"]
    
    
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var ListName: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Calculate the table rows to be displayed
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    //Display Rows
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath) as! SListTableViewCell
        
        let item = cell.viewWithTag(1) as! UITextField
        item.text=data[indexPath.row]
        let quantity=cell.viewWithTag(2) as! UILabel
        quantity.text=quantityCell[indexPath.row]
        return cell
    }
    
    // Delete Rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.data.remove(at: indexPath.row)
            self.myTable.reloadData()
        }
    }
    
    // Save Table to Firebase Database
    @IBAction func SaveTable(_ sender: UIButton) {
        
        let ref=FIRDatabase.database().reference().child(ListName.text!)
        let newRef=ref.childByAutoId()
        newRef.setValue(data)
    }
    
    
        // Reset Table
      @IBAction func resetBtn(_ sender: UIButton) {
        data = []
        data.removeAll()
        self.myTable.reloadData()
        
    }
    
   
}

