//
//  ChenGame.swift
//  PokerBuddy
//
//  Created by Luke Smith  on 4/7/22.
//

import Foundation
import PlayingCard
import FisherYates
import DeckOfPlayingCards

class ChenGuesserGame {
  
    func RunGame() -> [String: Bool]{
        var deck = Deck.standard52CardDeck()
        deck.shuffle()
        var handReturns: [String: Bool] = [:]
        
        let handOne = ChenHand(handArray: [deck.deal()!, deck.deal()!])
        let handTwo = ChenHand(handArray: [deck.deal()!, deck.deal()!])
        let handThree = ChenHand(handArray: [deck.deal()!, deck.deal()!])
        let gameHands = [handOne, handTwo, handThree]
        var highestScore = handOne.handValue()
        for hand in gameHands {
            if hand.handValue() > highestScore {
                highestScore = hand.handValue()
            }
        }
        
        for hand in gameHands {
            handReturns[hand.handString()] = hand.handValue() >= highestScore ? true : false
        }
        return handReturns
    }
    
    func RunGame2(numberOfHands: Int = 3) -> [String: Bool] {
        var deck = Deck.standard52CardDeck()
        deck.shuffle()
        var handReturns: [String: Bool] = [:]
        
        var gameHands: [ChenHand] = []
        for _ in 0..<numberOfHands {
            if let card1 = deck.deal(), let card2 = deck.deal() {
                gameHands.append(ChenHand(handArray: [card1, card2]))
            }
        }
        
        var highestScore = Int.min
        for hand in gameHands {
            if hand.handValue() > highestScore {
                highestScore = hand.handValue()
            }
        }
        
        for hand in gameHands {
            handReturns[hand.handString()] = hand.handValue() >= highestScore ? true : false
        }
        return handReturns
    }
    
    
}
