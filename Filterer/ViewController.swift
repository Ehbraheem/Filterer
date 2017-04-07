//
//  ViewController.swift
//  Filterer
//
//  Created by Ehbraheem on 03/04/2017.
//  Copyright © 2017 Ehbraheem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filteredImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet var secondaryMenu: UIView!
    
    @IBOutlet weak var bottomMenu: UIView!
    
    @IBOutlet weak var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected) {
            hideSecondaryView()
            sender.isSelected = false
        } else {
            showSecondaryMenu()
            sender.isSelected = true
        }
        
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomContraint = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        
        let leftContraint = secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        
        let rightContraint = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        let heightContraint = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        
        NSLayoutConstraint.activate([bottomContraint, leftContraint, rightContraint, heightContraint])
        
        view.layoutIfNeeded()
    }
    
    func hideSecondaryView() {
        secondaryMenu.removeFromSuperview()
    }
}

