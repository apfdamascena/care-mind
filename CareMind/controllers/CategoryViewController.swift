//
//  CategoryViewController.swift
//  CareMind
//
//  Created by alexdamascena on 16/05/22.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var categories: UICollectionView!
    @IBOutlet weak var underline: UIView!
    
    let cards: [Card] = [
        Card(image: "planta", title: "Cultivar plantas", content: "testando"),
        Card(image: "leitura", title: "Leitura", content: "testando"),
        Card(image: "filmes", title: "Cultivar plantas", content: "testando"),
        Card(image: "atividade", title: "Cultivar plantas", content: "testando"),
        Card(image: "musica", title: "Cultivar plantas", content: "testando"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories.dataSource = self
        categories.delegate = self
        constraints()
        categories.register(
            UINib(nibName: CardCollectionViewCell.nib, bundle: nil),
            forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    private func constraints(){
        let views = [
            titleCategory,
            categories,
            underline
        ]
        
        views.forEach{ view in
            view?.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            titleCategory.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 88),
            titleCategory.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            underline.topAnchor.constraint(equalTo: titleCategory.bottomAnchor, constant: 1),
            underline.heightAnchor.constraint(equalToConstant: 1),
            underline.widthAnchor.constraint(equalTo: titleCategory.widthAnchor),
            underline.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            
            categories.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 32),
            categories.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            categories.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 32),
            categories.heightAnchor.constraint(equalToConstant: 600)
            
        ])
    }
}


extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        let card = cards[indexPath.row]
        cell.draw(card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "categoryToChallenge", sender: self)
    }
}
