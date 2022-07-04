//
//  CategorySingleton.swift
//  CareMind
//
//  Created by alexdamascena on 19/05/22.
//

import Foundation


class CategorySingleton {
    
    
    static let shared = CategorySingleton()
    
    
    var models: [[Challenge]] = [];
    var index: Int = -1;
    var completed = 0;
    
    var plants = [
        Challenge(done: false, text: "Cultivar a planta roberto."),
        Challenge(done: false, text: "Cultivar a planta roberto."),
        Challenge(done: false, text: "Cultivar a planta roberto."),
    ]
    
    var read = [
        Challenge(done: false, text: "Ler a culpa é das estrelas"),
        Challenge(done: false, text: "Ler a culpa é das estrelas"),
        Challenge(done: false, text: "Ler a culpa é das estrelas")
    ]
    
    var movies = [
        Challenge(done: false, text: "Assistir bem vindo ao Éden"),
        Challenge(done: false, text: "Assistir bem vindo ao Éden"),
    ]
    
    var workout = [
        Challenge(done: false, text: "Fazer 20 agachamentos"),
        Challenge(done: false, text: "Fazer 20 agachamentos"),
    ]
    
    var music = [
        Challenge(done: false, text: "Escutar baby alô"),
        Challenge(done: false, text: "Escutar baby alô"),
    ]
    
    init(){
        self.models = [
            plants,
            read,
            movies,
            workout,
            music
        ]
    }
    
    func countCompletedChallenges(){
        var currentCompleted = 0
        models.forEach{ model in
            model.forEach{ challenge in
                if challenge.done {
                    currentCompleted += 1
                }
            }
        }
        completed = currentCompleted
    }
    
    func countCompletedChallengesAtCategory() -> Int {
        var currentCompleted = 0
        models[index].forEach{ challenge in
            if challenge.done {
                currentCompleted += 1
            }
        }
        return currentCompleted
    }
}
