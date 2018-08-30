//
//  SecondViewController.swift
//  Tabbed
//
//  Created by Johan Van Der Werff on 2018/08/29.
//  Copyright © 2018 Net1. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{

    let imageUrl  = URL(string: "https://via.placeholder.com/350x150")!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.downloadImage(with: imageUrl)
    }

    func downloadImage(with url: URL)
    {
        spinner(spinningSpinner: true)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            if error != nil
            {
                print(error!)
                return
            }
            
            DispatchQueue.main.async
            {
                self.imageView.image = UIImage(data: data!)
                self.spinner(spinningSpinner: false)
            }
        }.resume()
    }
    
    func spinner(spinningSpinner status: Bool)
    {
        if status == true
        {
            spinner.isHidden = false
            spinner.startAnimating()
        }
        else
        {
            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }
}

