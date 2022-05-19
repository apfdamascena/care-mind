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
    
    var dataIndex = -1;
    
    let goBackColor = UIColor(red: 251/255.0, green: 209/255.0, blue: 135/255.0 , alpha: 1)
    let borderColor = UIColor(red: 251/255.0, green: 209/255.0, blue: 135/255.0 , alpha: 0.7)

    let cards: [Card] = [
        Card(image: "planta", title: "Cultivar plantas", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque"),
        Card(image: "leitura", title: "Leitura", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque"),
        Card(image: "filmes", title: "Cultivar plantas", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque"),
        Card(image: "atividade", title: "Cultivar plantas", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque"),
        Card(image: "musica", title: "Cultivar plantas", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet id mauris tempor, pellentesque"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = goBackColor
        categories.dataSource = self
        categories.delegate = self
        constraints()
        
        categories.register(CardCCollectionViewCell.self, forCellWithReuseIdentifier: CardCCollectionViewCell.identifier)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCCollectionViewCell.identifier, for: indexPath) as? CardCCollectionViewCell else { return UICollectionViewCell() }
        
        let card = cards[indexPath.row]
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = borderColor.cgColor
        cell.draw(card)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataIndex = indexPath.row
        performSegue(withIdentifier: "categoryToChallenge", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let categoryViewController = segue.destination as? ChallengeViewController else { return }
        categoryViewController.challengesToDo = CategorySingleton.shared.models[dataIndex]
    }
}
