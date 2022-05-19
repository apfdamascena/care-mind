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
    
    let borderColor = UIColor(red: 251/255.0, green: 209/255.0, blue: 135/255.0 , alpha: 0.7)

    @IBOutlet weak var titleVideosView: UILabel!
    @IBOutlet weak var underline: UIView!
    @IBOutlet weak var videos: UICollectionView!
    
    let videosCard = [
        Video(image: "corpofala", title: "testando", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque", videoID: "AFYG2j0rkB8"),
        Video(image: "limpeza", title: "testando", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque", videoID: "FwcjXaXCEWY"),
        Video(image: "exercicio", title: "testando", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque", videoID: "DfIt58Ed5VU")
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos.dataSource = self
        videos.delegate = self
        
        player.load(withVideoId: "chlYYrisVVg",
                    playerVars: ["playsinline": 1])
        
        videos.register(CardCCollectionViewCell.self, forCellWithReuseIdentifier: CardCCollectionViewCell.identifier)
                
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCCollectionViewCell.identifier, for: indexPath) as? CardCCollectionViewCell else { return UICollectionViewCell() }
        let video = videosCard[indexPath.row]
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = borderColor.cgColor
        
        cell.draw(video)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        let video = videosCard[index]
        player.load(withVideoId: video.videoID)
    }
}
