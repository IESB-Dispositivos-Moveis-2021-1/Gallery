//
//  PhotoCollectionViewCell.swift
//  Gallery
//
//  Created by Pedro Henrique on 30/09/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func setup(with url: URL) {
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInteractive).async { [unowned self] in
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.photoImageView.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
}
