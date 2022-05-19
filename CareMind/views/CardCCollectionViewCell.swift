//
//  CardCCollectionViewCell.swift
//  CareMind
//
//  Created by alexdamascena on 18/05/22.
//

import UIKit

class CardCCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardCell"
    
    let backgroundCell = UIColor(red: 37/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let titleContent: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(cgColor: CGColor(red: 243, green: 243, blue: 243, alpha: 1))
        text.font = .systemFont(ofSize: 17, weight: .semibold)
        return text
    }()
    
    private let textContent: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(cgColor: CGColor(red: 243, green: 243, blue: 243, alpha: 1))
        text.font = .systemFont(ofSize: 13, weight: .light)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = backgroundCell
        contentView.addSubview(textContent)
        contentView.addSubview(image)
        contentView.addSubview(titleContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        image.frame = CGRect(x: 16, y: 16, width: 93, height: contentView.frame.height - 32)
        titleContent.frame = CGRect(x: image.frame.maxX + 16 , y: 19, width: contentView.frame.width - 32, height: 19)
        textContent.frame = CGRect(x: image.frame.maxX  + 17 , y: titleContent.frame.maxY + 8
                                    , width: contentView.frame.width - 32, height: contentView.frame.height - 32 - 19)
        textContent.sizeToFit()
    }

    func draw(_ card: Card){
        titleContent.text = card.title
        textContent.text = card.content
        image.image = UIImage(named: card.image)
    }
    
    func draw(_ video: Video){
        titleContent.text = video.title
        textContent.text = video.content
        image.image = UIImage(named: video.image)
    }
}
