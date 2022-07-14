//
//  PlayingCollectionViewCell.swift
//  AppTriunfo
//
//  Created by Raphael on 11/07/22.
//

import UIKit

class PlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
}
