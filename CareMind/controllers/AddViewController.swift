//
//  AddViewController.swift
//  CareMind
//
//  Created by alexdamascena on 18/05/22.
//

import UIKit

class AddViewController: UIViewController {
    
    let purpleColor = UIColor(red: 117/255.0, green: 110/255.0, blue: 206/255.0, alpha: 1)
    
    @IBOutlet weak var cardAddChallenge: UIView!
    
    public var completionHandler: ((String) -> Void)?
    @IBOutlet weak var newChallenge: UITextField!
    
    private lazy var blurredView: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = Blur(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        
        let dimmedView = UIView()
        dimmedView.backgroundColor = .black.withAlphaComponent(0.6)
        dimmedView.frame = self.view.bounds
        
        view.addSubview(blurEffectView)
        view.addSubview(dimmedView)
        return view
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        constraints()
    }
    
    private func  setupView(){
        view.addSubview(blurredView)
        view.sendSubviewToBack(blurredView)
        cardAddChallenge.layer.cornerRadius = 4
        cardAddChallenge.layer.borderWidth = 1
        cardAddChallenge.layer.borderColor = purpleColor.cgColor
    }
    
    private func constraints(){
        cardAddChallenge.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardAddChallenge.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardAddChallenge.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -60),
            cardAddChallenge.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            cardAddChallenge.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 32),
            cardAddChallenge.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        completionHandler?(newChallenge.text ?? "")
        dismiss(animated: true)
    }
    
}
