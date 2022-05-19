//
//  ChallengeTableViewCell.swift
//  CareMind
//
//  Created by alexdamascena on 18/05/22.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    static let identifier = "ChallengeTableCell"
    
    var checkbox = Checkbox()
    
    let backgroundCell = UIColor(red: 37/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
    
    private let challengeContent: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 243, green: 243, blue: 243, alpha: 1))
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        checkbox = Checkbox(frame: CGRect(x: 0 , y: 10, width: 32, height: 32))
        backgroundColor = backgroundCell
        contentView.addSubview(checkbox)
        contentView.addSubview(challengeContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        challengeContent.frame = CGRect(x: checkbox.frame.maxX + 8,
                           y: 10,
                           width: contentView.frame.width - 40,
                           height: contentView.frame.height - 16)
    }
    
    override func prepareForReuse() {

    }
    
    func draw(_ challenge: Challenge){
        challengeContent.text = challenge.text
    }
}
