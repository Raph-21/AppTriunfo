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
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        cell?.setup(title: movie.title, image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)
        }
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> PlayingCollectionViewCell {
        let cell = playingCollectionView.dequeueReusableCell(withReuseIdentifier: PlayingCollectionViewCell.cellIdentifier, for: indexPath) as? PlayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        let year: String = "\(movie.releaseDate.prefix(4))"
        
        cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: imagem)
        }
        
        return cell ?? PlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let movie = upcomingMovies[indexPath.item]
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        
        cell?.setup(title: movie.title,
                    year: year,
                    image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: imagem)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
