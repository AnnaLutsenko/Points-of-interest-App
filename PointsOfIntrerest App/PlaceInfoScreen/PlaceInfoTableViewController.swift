//
//  PlaceInfoTableViewController.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

class PlaceInfoTableViewController: UITableViewController {
    
    var objects: [DisplayObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    
    func initController() {
        registerCells()
        //
        let name = DisplayName(name: "UTEUT", rating: "9.0", color: .blue)
        let descr = DisplayDescription(description: "son neuon onuohu noun onteuhno eutnouno ontehun unouahcp uchcen forCellReuseIdentifier forCellReuseIdentifier forCellReuseIdentifier forCellReuseIdentifier forCellReuseIdentifier")
        let time = DisplayTimeOfWork(time: "Open from: 10:00 till 20:00")
        let durationTime = DisplayDurationOfTrip(durationTime: "2 hours")
        objects.append(name)
        objects.append(descr)
        objects.append(time)
        objects.append(durationTime)
    }
    
    func registerCells() {
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        //
        tableView.register(PlaceNameCell.self, forCellReuseIdentifier: PlaceNameCell.reuseID)
        tableView.register(PlaceDescriptionCell.self, forCellReuseIdentifier: PlaceDescriptionCell.reuseID)
        tableView.register(PlaceTimeOfWorkCell.self, forCellReuseIdentifier: PlaceTimeOfWorkCell.reuseID)
        tableView.register(PlaceDurationCell.self, forCellReuseIdentifier: PlaceDurationCell.reuseID)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        let obj = objects[indexPath.row]

        if let name = obj as? DisplayName {
           let dataCell = tableView.dequeueReusableCell(withIdentifier: PlaceNameCell.reuseID) as? PlaceNameCell
            dataCell?.displayData(name)
            cell = dataCell
        } else if let descr = obj as? DisplayDescription {
            let dataCell = tableView.dequeueReusableCell(withIdentifier: PlaceDescriptionCell.reuseID) as? PlaceDescriptionCell
            dataCell?.displayData(descr)
            cell = dataCell
        } else if let time = obj as? DisplayTimeOfWork {
            let dataCell = tableView.dequeueReusableCell(withIdentifier: PlaceTimeOfWorkCell.reuseID) as? PlaceTimeOfWorkCell
            dataCell?.displayData(time)
            cell = dataCell
        } else if let durationTime = obj as? DisplayDurationOfTrip {
            let dataCell = tableView.dequeueReusableCell(withIdentifier: PlaceDurationCell.reuseID) as? PlaceDurationCell
            dataCell?.displayData(durationTime)
            cell = dataCell
        }
        
        return cell ?? UITableViewCell()
    }

}
