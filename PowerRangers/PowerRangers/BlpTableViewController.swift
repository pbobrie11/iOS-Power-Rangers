//
//  BlpTableViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpTableViewController: UITableViewController {
    
    var blpArray = [Blp]()
    var lastNamesOnly = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var names = [String]()
        var locations = [String]()
        var tracks = [String]()
        var roles = [String]()
        var interestsDict = [String]()
        var phoneNumbers = [String]()
        var emails = [String]()
        var housingDict = [String]()
        var photoDict = [String]()
        var lastNameDict = [String]()
        var idDict = [String]()
        var nextLocationArr = [String]()
        
        func buildBlpArray(fullName: [String], location: [String], track: [String], phoneNum: [String], email: [String], role:[String], interests: [String], housing: [String], photo: [String],lastNameOnly: [String], id: [String], nextLoc: [String]){
            
            var i = 0
            let inArray = fullName.count

            while i < inArray {
            
                let newBlp = Blp(name: fullName[i], location: location[i], track: track[i], phoneNum: phoneNum[i], email: email[i], role: role[i], interests: interests[i], housing: housing[i], photo: photo[i], lastName: lastNameOnly[i], identifier: id[i], nextLocation: nextLoc[i])!
            
            blpArray += [newBlp]
             ++i
            }
            

        }
        
        DataManager.grabNames { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["blps"] as? [[String: AnyObject]] {
                    for blps in blps {
                        // Pulling first and last names and combining into one dictionary
                        if let firstName = blps["firstName"] as? String {
                            if let lastName = blps["lastName"] as? String {
                                names.append(firstName + " " + lastName)
                            }
                        }
                        // pulling track info into separate dictionary
                        if let track = blps["track"] as? String {
                            tracks.append(track)
                        }
                        // pulling role into separate dictionary
                        if let role = blps["role"] as? String {
                            roles.append(role)
                        }
                        //pulling locations into dictionary
                        if let location = blps["location"] as? String {
                            locations.append(location)
                        }
                        // pull interests
                        if let interests = blps["interests"] as? String {
                            interestsDict.append(interests)
                        }
                        // pull phone
                        if let phoneNum = blps["phoneNum"] as? String {
                            phoneNumbers.append(phoneNum)
                        }
                        //pull emails
                        if let email = blps["email"] as? String {
                            emails.append(email)
                        }
                        //pull housing
                        if let housing = blps["housing"] as? String {
                            housingDict.append(housing)
                        }
                        //pull photo dict
                        if let photos = blps["photo"] as? String {
                            photoDict.append(photos)
                        }
                        //last Name only
                        if let lastNameOnly = blps["lastName"] as? String {
                            lastNameDict.append(lastNameOnly)
                        }
                        if let identifier = blps["identifier"] as? String {
                            idDict.append(identifier)
                        }
                        //next location
                        if let nextLocation = blps["nextLocation"] as? String {
                            nextLocationArr.append(nextLocation)
                        }
                    }
                    
                    
                    buildBlpArray(names, location: locations, track: tracks, phoneNum: phoneNumbers, email: emails, role: roles, interests: interestsDict, housing: housingDict, photo: photoDict, lastNameOnly: lastNameDict, id: idDict, nextLoc: nextLocationArr)
                    
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
            
            
        }
        
        
        
   
    }
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    
    
    
   
    
    /* `UITableView` consists of sections and rows
    default is a single section table, i.e., a plain list
    method returns the number of rows in this default section */
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int)
        -> Int {
            return self.blpArray.count
    }
    
    /* `UITableViewCell` represent individual table cells
    table cells are reused
    a unique identifier is used to group reusable cells
    returns a cell for a given section and row */
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let blpProfile = self.blpArray[indexPath.row]

            
            let cell = tableView.dequeueReusableCellWithIdentifier("BlpTableViewCell", forIndexPath: indexPath) as! BlpTableViewCell
            cell.nameLabel.text = blpProfile.name
            cell.locationLabel.text = blpProfile.location
            cell.trackLabel.text = blpProfile.track
            
            
            
            //Housing check
                let house = UIImage (named: "Housing")!
            let houseCheck = blpProfile.housing
           
            
            if (houseCheck == "No") {
            cell.housingIcon.hidden = true
            } else {
                cell.housingIcon.image = house
            }
         
            
            
            return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // Segue to the individual profiles
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProfile" {
            let blpDetailViewController = segue.destinationViewController as! viewSpecificBlp
            
            //get the cell that generates segue
            
            if let selectedBlpCell = sender as? BlpTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBlpCell)!
                let selectedBlp = blpArray[indexPath.row]
                blpDetailViewController.blp = selectedBlp
            }
        }
               }
    
    
    
    
    //last bracket
            }


    

   