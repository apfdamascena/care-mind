//
//  Checkbox.swift
//  CareMind
//
//  Created by alexdamascena on 18/05/22.
//

import UIKit

class Checkbox: UIView {

    var isChecked = false
    
    public var completionHandler: ((Bool) -> Void)?
    
    let whiteBackground = UIColor(red: 231/255.0, green: 231/255.0, blue: 231/255.0, alpha: 1)
    let borderColorCheckbox = UIColor(red: 117/255.0, green: 110/255.0, blue: 206/255.0, alpha: 0.4).cgColor
    let checkedColor = UIColor(red: 117/255.0, green: 110/255.0, blue: 206/255.0, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.3
        layer.borderColor = borderColorCheckbox
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = whiteBackground
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckBox))
        self.addGestureRecognizer(gesture)
    }
    
    func drawingNewChallenge(){
        if isChecked {
            backgroundColor = checkedColor
        } else {
            backgroundColor = whiteBackground
        }
    }
    
    @objc func didTapCheckBox(){
        if !isChecked {
            backgroundColor = checkedColor
        } else {
            backgroundColor = whiteBackground
        }
        completionHandler?(!isChecked)
        isChecked = !isChecked
    }
    
    init(){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleUserClick(_ wasClicked: Bool){
        if wasClicked {
            backgroundColor = .systemCyan
        } else {
            backgroundColor = .systemGray
        }
    }
    
}
