//
//  ViewController.swift
//  CareMind
//
//  Created by alexdamascena on 15/05/22.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var careMindLogo: UIImageView!
    @IBOutlet weak var memoji: UIImageView!
    
    @IBOutlet weak var helloUsername: UILabel!
    @IBOutlet weak var leftSentenceStatus: UILabel!
    @IBOutlet weak var mindStatus: UILabel!
    @IBOutlet weak var callToAction: UILabel!
    
    @IBOutlet weak var underline: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: Notification.Name("handle-memoji"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("handle-memoji"), object: nil)
    }
    
    @objc func didReceiveNotification(_ notification: Notification){
        guard let happy = notification.object as? Int else { return }
        if(happy >= 6){
            memoji.image = UIImage(named: "memoji-happy")
        }
    }

    private func constraints(){
        let views = [
            careMindLogo,
            helloUsername,
            underline,
            memoji,
            leftSentenceStatus,
            mindStatus,
            callToAction
        ]
        
        views.forEach{ view in
            view?.translatesAutoresizingMaskIntoConstraints = false
            
        }

        NSLayoutConstraint.activate([
            careMindLogo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 73),
            careMindLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            helloUsername.heightAnchor.constraint(equalToConstant: 46),
            helloUsername.topAnchor.constraint(equalTo: careMindLogo.bottomAnchor, constant: 32),
            helloUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            
            underline.heightAnchor.constraint(equalToConstant: 1),
            underline.topAnchor.constraint(equalTo: helloUsername.bottomAnchor, constant: 1),
            underline.widthAnchor.constraint(equalTo: helloUsername.widthAnchor),
            underline.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            memoji.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 42),
            memoji.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            memoji.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 32),
            memoji.widthAnchor.constraint(equalToConstant: 326),
            memoji.heightAnchor.constraint(equalToConstant: 328),
            
            leftSentenceStatus.topAnchor.constraint(equalTo: memoji.bottomAnchor, constant: 44),
            leftSentenceStatus.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            mindStatus.topAnchor.constraint(equalTo: memoji.bottomAnchor, constant: 44),
            mindStatus.leftAnchor.constraint(equalTo: leftSentenceStatus.rightAnchor, constant: 5),
            
            callToAction.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            callToAction.topAnchor.constraint(equalTo: leftSentenceStatus.bottomAnchor, constant: 4)
        ])
    }
}

