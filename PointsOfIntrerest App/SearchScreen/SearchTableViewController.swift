//
//  SearchTableViewController.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit
import Kingfisher

class SearchTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// Services
    let venueDataService = VenueDataProvider()
    let locationService = LocationService()
    
    /// Models
    var venues: [Venue] = []
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    func registerCell() {
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.reuseID)
    }
    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let navController = segue.destination as? UINavigationController,
//                let vc = navController.topViewController as? PlaceInfoTableViewController else {
//                    fatalError("DetailViewController")
//            }
//            
//            // Manage the display mode button
//            vc.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//            vc.navigationItem.leftItemsSupplementBackButton = true
//            
//            // Configure the secondary view controller
//            vc.venue = venues[index]
//        }
    
    // MARK: - Requests
    private func getVenues(_ query: String?) {
        venueDataService.searchVenues(query: query, location: locationService.lastCoordinate) { [weak self] (result) in
            
            switch result {
            case .success(let venues):
                self?.venues = venues
                self?.tableView.reloadData()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.reuseID) as? PlaceTableViewCell else {
            return UITableViewCell()
        }
        let venue = venues[indexPath.row]
        cell.photoImgView.image = #imageLiteral(resourceName: "locationImg")
        //
        if let url = venue.categoryIconURL(size: ._44) {
            cell.photoImgView.kf.setImage(with: url, options: [.imageModifier(RenderingModeImageModifier(renderingMode: .alwaysTemplate))])
            cell.photoImgView.tintColor = .blue
        }
        cell.nameLbl.text = venue.model.name
        cell.addressLbl.text = venue.address
        //
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        index = indexPath.row
        if let splitVC = splitViewController as? VenueSplitViewController {
            splitVC.sentVenueToDetailVC(venues[indexPath.row])
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        getVenues(searchBar.text)
    }
    
}
