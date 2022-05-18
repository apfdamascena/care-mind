//
//  VideosViewController.swift
//  CareMind
//
//  Created by alexdamascena on 16/05/22.
//

import Foundation
import UIKit
import YouTubeiOSPlayerHelper


class VideosViewController: UIViewController {
    
    @IBOutlet var player: YTPlayerView!

    @IBOutlet weak var titleVideosView: UILabel!
    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var videos: UICollectionView!
    
    let videosCard = [
        Video(image: "corpofala", title: "testando", content: "testando", videoID: "RB-RcX5DS5A"),
        Video(image: "limpeza", title: "testando", content: "testando", videoID: "RB-RcX5DS5A"),
        Video(image: "planta", title: "testando", content: "testando", videoID: "RB-RcX5DS5A"),
        Video(image: "planta", title: "testando", content: "testando", videoID: "RB-RcX5DS5A"),
        Video(image: "planta", title: "testando", content: "testando", videoID: "RB-RcX5DS5A"),
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos.dataSource = self
        videos.delegate = self
        
        player.load(withVideoId: "RB-RcX5DS5A",
                    playerVars: ["playsinline": 1])
        
        videos.register(
            UINib(nibName: CardCollectionViewCell.nib, bundle: nil),
            forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        constraints()
    }
    
    private func constraints(){
        let views = [
            player,
            titleVideosView,
            underline, videos
        ]
        
        views.forEach{ view in
            view?.translatesAutoresizingMaskIntoConstraints = false
            
        }

        NSLayoutConstraint.activate([
            titleVideosView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 88),
            titleVideosView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            underline.topAnchor.constraint(equalTo: titleVideosView.bottomAnchor, constant: 1),
            underline.heightAnchor.constraint(equalToConstant: 1),
            underline.widthAnchor.constraint(equalTo: titleVideosView.widthAnchor),
            underline.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            player.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            player.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3),
            player.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 24),
            player.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            player.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width),
            
            videos.topAnchor.constraint(equalTo: player.bottomAnchor, constant: 32),
            videos.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            videos.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 32),
            videos.heightAnchor.constraint(equalToConstant: 332)
            
        ])
    }
}

extension VideosViewController: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        player.playVideo()
    }
}


extension VideosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videosCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        let video = videosCard[indexPath.row]
        cell.draw(video)
        return cell
    }
}
