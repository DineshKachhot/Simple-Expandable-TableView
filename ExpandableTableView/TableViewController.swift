//
//  TableViewController.swift
//  ExpandableTableView
//
//  Created by Dinesh Kachhot on 06/08/19.
//  Copyright © 2019 Dinesh Kachhot. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var twoDimentionalArray = [
        Names(title: "Mountains", expandable: true, names: ["Mojave", "Mount Rainier", "Sierra", "Mount Albert", "Mount Foraker"]), // Mountains
        Names(title: "Lakes", expandable: true, names: ["Michigan", "Superior", "Erie", "Huron", "Ontario", "Tahoe"]), // Lakes
        Names(title: "Rivers", expandable: true, names: ["Mississippi", "Missouri", "Ohio", "Colorado"]), // Rivers
        Names(title:"Beaches", expandable: true, names: ["Duke Kahanamoku", "Coast Guard", "Hapuna", "Coronado"]), // Beaches
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Destinations"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func handleExpandClose(sender: UIButton) {
        let section = sender.tag
        var indexPaths = [IndexPath]()
        for index in twoDimentionalArray[section].names.indices {
            indexPaths.append(IndexPath(row: index, section: section))
        }
        
        let isExpanded = twoDimentionalArray[section].expandable
        twoDimentionalArray[section].expandable = !isExpanded
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let title = twoDimentionalArray[section].title
        
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.tintColor = .white
        button.tag = section
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        return button
//        let title = UILabel()
//        title.text = "\(section)"
//        title.contentMode = .center
//        title.backgroundColor = .gray
//        title.textColor = .white
//        return title;
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimentionalArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !twoDimentionalArray[section].expandable {
            return 0
        }
        return twoDimentionalArray[section].names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = twoDimentionalArray[indexPath.section].names[indexPath.row]
//         Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
