//
//  ViewController.swift
//  Flag
//
//  Created by Ильфат Салахов on 19.01.2023.
//

import UIKit

final class MainTableViewController: UITableViewController {
    
    // MARK: -Private Properties
    private let flagArray = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    // MARK: -Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flags"
    }
}

// MARK: -TableViewDataSource
extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flagArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let flag = flagArray[indexPath.row]
        
        cell.config(flag: flag)
        
        cell.flagImageView.contentMode = .scaleToFill
        
        cell.flagImageView.layer.cornerRadius = 10
        cell.flagImageView.layer.borderColor = UIColor.black.cgColor
        cell.flagImageView.layer.borderWidth = 1
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let flag = flagArray[indexPath.row]
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailVC.flagName = flag
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    private func setopTableViewCell(cell: UITableViewCell) {
        
    }
}


