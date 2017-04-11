//
//  ViewController.swift
//  Filterer
//
//  Created by Ehbraheem on 03/04/2017.
//  Copyright © 2017 Ehbraheem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var filteredImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet var secondaryMenu: UIView!
    
    @IBOutlet weak var bottomMenu: UIView!
    
    @IBOutlet weak var filterButton: UIButton!
    
//    @IBOutlet weak var onNewPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onNewPhoto(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: { (action) in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil
        ))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    @IBAction func onShare(_ sender: UIButton) {
        let activityContoller = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        
        present(activityContoller, animated: true, completion: nil)
    }
    
    
    func showCamera() {
        let imagePicker = self.imageSeletion(selector: .camera)
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func showAlbum ()  {
        let imagePicker = self.imageSeletion(selector: .photoLibrary)
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imageSeletion(selector: UIImagePickerControllerSourceType) -> UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType  = selector
        
        return picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
        
        self.secondaryMenu.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.secondaryMenu.alpha = 1.0
        } )
    }
    
    func hideSecondaryView() {
       
        UIView.animate(withDuration: 0.4,
                       animations: {self.secondaryMenu.alpha = 1.0},
                       completion: {completed in
                        if (completed) {
                            self.secondaryMenu.removeFromSuperview()
                        }})

    }
}

