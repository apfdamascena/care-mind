//
//  CardCollectionViewCell.swift
//  CareMind
//
//  Created by alexdamascena on 16/05/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCard: UIImageView!
    
    @IBOutlet weak var contentCard: UILabel!
    @IBOutlet weak var titleCard: UILabel!
    
    static let nib = "CardCollectionViewCell"
    static let identifier = "CardCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func draw(_ card: Card){
        imageCard.image = UIImage(named: card.image)
        titleCard.text = card.title
        contentCard.text = card.content
    }

}
