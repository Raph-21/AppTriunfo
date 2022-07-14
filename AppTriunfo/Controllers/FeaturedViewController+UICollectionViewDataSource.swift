//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  AppTriunfo
//
//  Created by Raphael on 12/07/22.
//

import UIKit

extension FeaturedViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView{
            return popularMovies.count
        } else if collectionView == self.playingCollectionView{
            return nowPlayingMovies.count
        } else if collectionView == self.upcomingCollectionView{
            return upcomingMovies.count
        } else {
            return 0
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> PlayingCollectionViewCell {
        let cell = playingCollectionView.dequeueReusableCell(withReuseIdentifier: PlayingCollectionViewCell.cellIdentifier, for: indexPath) as? PlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        cell?.dateLabel.text = year
        cell?.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? PlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        cell?.titleLabel.text = upcomingMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: upcomingMovies[indexPath.item].poster)
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        cell?.dateLabel.text = year
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == self.playingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == self.upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
}
