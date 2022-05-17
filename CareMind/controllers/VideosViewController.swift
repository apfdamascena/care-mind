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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.load(withVideoId: "RB-RcX5DS5A",
                    playerVars: ["playsinline": 1])
    }
}

extension VideosViewController: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        player.playVideo()
    }
}
