//
//  ImageViewController.swift
//  TestWorkWithNet
//
//  Created by Иван Гришин on 30.09.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
        
    }
 
    private func fetchImage() {
        guard let url = URL(string: "https://avatars.mds.yandex.net/get-zen_doc/1581919/pub_600f060d052efe27dfbdca58_60104a097d9f5f1ccc93d5c6/scale_2400") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            }
            
        }.resume()
    }
    
}
