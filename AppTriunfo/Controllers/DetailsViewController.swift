//
//  DetailsViewController.swift
//  AppTriunfo
//
//  Created by Raphael on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        guard let movie = movie else {
            return
        }
        
        title = movie.title
        backdropImage.image = UIImage()
        titleLabel.text = movie.title
        posterImage.image = UIImage()
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        Task{
            let backdropImage = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imageBackdrop = UIImage(data: backdropImage)
            self.backdropImage.image = imageBackdrop
            
            let posterImage = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagePoster = UIImage(data: posterImage)
            self.posterImage.image = imagePoster
        }
    
    }
    
    
}
