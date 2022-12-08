//
//  ViewController.swift
//  Image URLSESSION
//
//  Created by Maximilian on 08.12.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var ImageView: UIImageView!
    
    
    
    @IBOutlet var Label: UILabel!
    
    
    @IBOutlet var getImageButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getImagePressed(_ sender: UIButton) {
        
        guard URL(string: "https://www.vecteezy.com/free-photos/cat") != nil else { return }
        
        let session = URLSession.shared
    }
    
}

