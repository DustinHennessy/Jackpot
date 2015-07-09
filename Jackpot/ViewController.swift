//
//  ViewController.swift
//  Jackpot
//
//  Created by Dustin Hennessy on 7/8/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var numbersArray = [Numbers]()
    @IBOutlet var ticketsTableView: UITableView!
    
    
    
    //MARK: - Core Methods
    
    func fetchTasks() {
        var numbersQuery = PFQuery(className: "Numbers")
        numbersQuery.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                println("Successfully got \(objects!.count) numbers")
                if let objects = objects as? [Numbers] {
                    self.numbersArray = objects
                    println("Numbers count: \(self.numbersArray.count)")
                    self.ticketsTableView.reloadData()
                }
                
            }
        }
    }
    
    
    
    //MARK: - Table View Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        let currentTicket = numbersArray[indexPath.row] as Numbers
        cell.textLabel!.text = "\(currentTicket.number1)" + "," + "\(currentTicket.number2)" + "," + "\(currentTicket.number3)" + "," + "\(currentTicket.number4)" + "," + "\(currentTicket.number5)" + "," + "\(currentTicket.powerBall)"
        
        
    return cell
        
    }
    
    func getRandomTicket() -> Numbers {
        
        let ticket = Numbers()
        
        ticket.number1 = Int(arc4random_uniform(75)+1)
        
        do { ticket.number2 = Int(arc4random_uniform(75)+1) }
            while ticket.number2 == ticket.number1
        
        do { ticket.number3 = Int(arc4random_uniform(75)+1) }
            while ticket.number3 == ticket.number2 || ticket.number3 == ticket.number1
        
        do { ticket.number4 = Int(arc4random_uniform(75)+1) }
            while ticket.number4 == ticket.number3 || ticket.number4 == ticket.number2 || ticket.number4 == ticket.number1
        
        do { ticket.number5 = Int(arc4random_uniform(75)+1) }
            while ticket.number5 == ticket.number4 || ticket.number5 == ticket.number3 || ticket.number5 == ticket.number2 || ticket.number5 == ticket.number1
        
        ticket.powerBall = Int(arc4random_uniform(15)+1)
//        ticket.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
//            if success {
//                self.fetchTasks()
//                self.ticketsTableView.reloadData()
//                println("success")
//            } else {
//                println("fail")
//            }
//        })
        println("\(ticket.number1)")
        println("\(ticket.number2)")
        println("\(ticket.number3)")
        println("\(ticket.number4)")
        println("\(ticket.number5)")
        println("\(ticket.powerBall)")

        return ticket
    }
    
    
     func addTicket(sender: UIBarButtonItem) {
        let ticket = getRandomTicket()

        ticket.saveInBackgroundWithBlock({(success: Bool, error: NSError?) -> Void in
            if success {
                self.fetchTasks()
                self.ticketsTableView.reloadData()
                println("success")
            } else {
                println("fail")
            }
        })
        
        
        
    }
    
     func getWinningTicket(sender: UIBarButtonItem) {
        
        let winningTicket = getRandomTicket()
        
        if
        //starting to determine winners
        
        
        
    }
    //MARK: - Interactivity Methods
    


    //MARK: - Life Cycle Methods
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTasks()
         ticketsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        var playButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: "getWinningTicket:")
        var addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addTicket:")
        self.navigationItem.rightBarButtonItems = [playButton, addButton]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

