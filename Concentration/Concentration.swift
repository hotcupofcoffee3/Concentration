//
//  Concentration.swift
//  Concentration
//
//  Created by Adam Moore on 12/8/17.
//  Copyright © 2017 Adam Moore. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    var randomCardNumber = Int()
    
    var totalCards = Int()
    
    var currentRandomCard = Card()
    
    var shuffledCards = [Card]()
    
    var IndexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = IndexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                IndexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                IndexOfOneAndOnlyFaceUpCard = index
            }
        } else {
            
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        totalCards = cards.count
        
        for _ in 0..<cards.count {
            randomCardNumber = Int(arc4random_uniform(UInt32(cards.count)))
            currentRandomCard = cards.remove(at: randomCardNumber)
            shuffledCards.append(currentRandomCard)
        }
        cards = shuffledCards
        shuffledCards = []
    }
}
