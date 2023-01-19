//
//  DetailViewController.swift
//  Flag
//
//  Created by Ильфат Салахов on 19.01.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var flagName: String?
    
    @IBOutlet var flagImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupImage()
    }
    
    private func setupImage() {
        flagImage.image = UIImage(named: flagName ?? "")
        
        flagImage.contentMode = .scaleToFill
        
        flagImage.layer.cornerRadius = 10
        flagImage.layer.borderColor = UIColor.black.cgColor
        flagImage.layer.borderWidth = 1
    }
    
    private func setupNavigationController() {
        title = flagName?.uppercased()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonTapped))
    }
    
    @objc func buttonTapped() {
        guard let image = flagImage.image?.jpegData(compressionQuality: 0.8) else {
            print("No image Found")
            return
        }
        settingActivityVC(items: image)

    }
    
    private func settingActivityVC(items: Any) {
        let activityViewController = UIActivityViewController(activityItems: [items], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
}

