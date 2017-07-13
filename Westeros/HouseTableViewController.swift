//
//  HouseTableViewController.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 13/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class HouseTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var houses = [House]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "Houses"
        self.houses = Repository.local.houses
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default,
                                   reuseIdentifier: "myIdentifier")
        
        cell.textLabel?.text = "House \(houses[indexPath.row].name)"
        cell.imageView?.image = (houses[indexPath.row].sigil.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var house : House
        house = houses[indexPath.row]
        
        let houseVC = HouseViewController(model: house)
        
        self.navigationController?.pushViewController(houseVC, animated: true)
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
