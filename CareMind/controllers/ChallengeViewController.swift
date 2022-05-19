//
//  ChallengeViewController.swift
//  CareMind
//
//  Created by alexdamascena on 17/05/22.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    @IBOutlet weak var titleChallenge: UILabel!
    @IBOutlet weak var completedChallenge: UILabel!
    @IBOutlet weak var challenges: UITableView!
    @IBOutlet weak var addChallenge: UIButton!
    
    let backgroundCellAfterSelected = UIColor(red: 37/255.0, green: 43/255.0, blue: 54/255.0, alpha: 1)
    
    var challengesToDo = [
        Challenge(done: false, text: "Olhar a plantinha na porta"),
        Challenge(done: false, text: "Olhar a plantinha na porta"),
        Challenge(done: false, text: "Olhar a plantinha na porta"),
        Challenge(done: false, text: "Olhar a plantinha na porta"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        addChallenge.layer.cornerRadius = 4
        challenges.dataSource = self
        challenges.delegate = self
        challenges.register(ChallengeTableViewCell.self, forCellReuseIdentifier: ChallengeTableViewCell.identifier)
    }
    
    private func constraints(){
        let views = [
            titleChallenge,
            completedChallenge,
            challenges,
            addChallenge
        ]
        
        views.forEach{ view in
            view?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleChallenge.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 114),
            titleChallenge.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            completedChallenge.topAnchor.constraint(equalTo: titleChallenge.bottomAnchor, constant: 8),
            completedChallenge.centerXAnchor.constraint(equalTo: titleChallenge.centerXAnchor),
            
            challenges.topAnchor.constraint(equalTo: completedChallenge.bottomAnchor, constant: 32),
            challenges.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32),
            challenges.rightAnchor.constraint(equalTo: self.view.leftAnchor, constant: UIScreen.main.bounds.width - 32),
            challenges.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 ),
            
            addChallenge.bottomAnchor.constraint(equalTo: challenges.bottomAnchor, constant: 60),
            addChallenge.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addChallenge.heightAnchor.constraint(equalToConstant: 47),
            addChallenge.widthAnchor.constraint(equalToConstant: 191)
        ])
    }
    
    @IBAction func didTapAddChallenge(_ sender: UIButton) {
        guard let addViewController = storyboard?.instantiateViewController(withIdentifier: "addView") as? AddViewController else { return }
        addViewController.modalPresentationStyle = .overCurrentContext
        addViewController.modalTransitionStyle = .crossDissolve
        addViewController.completionHandler = { challenge in
            self.challengesToDo.append(Challenge(done: false, text: challenge))
            self.challenges.reloadData()
        }
        present(addViewController, animated: true)
    }
}


extension ChallengeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  challengesToDo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChallengeTableViewCell.identifier, for: indexPath) as? ChallengeTableViewCell else { return UITableViewCell() }
        let challengeToDraw = challengesToDo[indexPath.row]
        cell.draw(challengeToDraw)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: cell.frame.height - 1, width: cell.frame.width, height: 0.3)
        bottomLine.backgroundColor = UIColor(red: 117/255.0, green: 110/255.0, blue: 206/255.0, alpha: 0.4).cgColor
        cell.layer.addSublayer(bottomLine)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  52
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            challengesToDo.remove(at: indexPath.row)
            challenges.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = challenges.cellForRow(at: indexPath) as? ChallengeTableViewCell else { return }
        cell.contentView.backgroundColor = backgroundCellAfterSelected
    }
    
    
}
