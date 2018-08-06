//
//  PlaceInfoTableViewController.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class PlaceInfoTableViewController: UITableViewController, StoryboardInstance {
    
    /// Services
    let directionDataProvider = DirectionsDataProvider()
    let venueDataService = VenueDataProvider()
    let locationService = LocationService()
    
    /// Models
    var objects: [DisplayObject] = []
    
    var venue: Venue? {
        didSet {
            guard let v = venue else { return }
            displayData(for: v)
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchData()
        fetchDirections()
    }
    
    func displayData(for venue: Venue) {
        objects.removeAll()
        DisplayName(venue: venue).flatMap { objects.append($0) }
        DisplayDescription(venue: venue).flatMap { objects.append($0) }
        DisplayTimeOfWork(venue: venue).flatMap { objects.append($0) }
        DisplayMap(venue: venue).flatMap { objects.append($0)}
    }
    
    func registerCells() {
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        //
        tableView.register(PlaceNameCell.self, forCellReuseIdentifier: PlaceNameCell.reuseID)
        tableView.register(PlaceDescriptionCell.self, forCellReuseIdentifier: PlaceDescriptionCell.reuseID)
        tableView.register(PlaceTimeOfWorkCell.self, forCellReuseIdentifier: PlaceTimeOfWorkCell.reuseID)
        tableView.register(PlaceDurationCell.self, forCellReuseIdentifier: PlaceDurationCell.reuseID)
        tableView.register(MapCell.self, forCellReuseIdentifier: MapCell.reuseID)
    }
    
    // MARK: - Requests
    func fetchDirections() {
        guard let location = locationService.lastCoordinate,
            let v = venue else { return }
        SVProgressHUD.show()
        directionDataProvider.fetchDirections(from: location, to: v.location) { [weak self] (results) in
            SVProgressHUD.dismiss()
            
            switch results {
            case .success(let duration):
                let obj = DisplayDurationOfTrip(durationTime: duration)
                if let vc = self,
                 vc.objects.count > 1 {
                    vc.objects.insert(obj, at: vc.objects.count-1)
                } else {
                    self?.objects.insert(obj, at: 0)
                }
                self?.tableView.reloadData()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchData() {
        guard let venue = venue else { return }
        SVProgressHUD.show()
        venueDataService.getVenueDetails(venueId: venue.model.id) { [weak self] (results) in
            SVProgressHUD.dismiss()
            
            switch results {
            case .success(let venue):
                self?.venue = venue
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
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
        } else if let map = obj as? DisplayMap {
            let dataCell = tableView.dequeueReusableCell(withIdentifier: MapCell.reuseID) as? MapCell
            dataCell?.displayData(map)
            cell = dataCell
        }
        
        return cell ?? UITableViewCell()
    }

}
