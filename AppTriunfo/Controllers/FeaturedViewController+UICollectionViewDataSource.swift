//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  AppTriunfo
//
//  Created by Raphael on 12/07/22.
//

import UIKit

extension FeaturedViewController{
    
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
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? PlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        cell?.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
        cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? UICollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell
        
        cell?.titleLabel.text = upcomingMovies[indexPath.item].title
        cell?.image.image = UIImage(named: upcomingMovies[indexPath.item].poster)
        cell?.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
        
        return cell ?? UICollectionViewCell()
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
