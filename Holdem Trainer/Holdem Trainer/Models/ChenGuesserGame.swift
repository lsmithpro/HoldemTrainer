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
import Logging

//class ChenGuesserGame {
//
//    func RunGame() -> [String: Bool]{
//        var deck = Deck.standard52CardDeck()
//        deck.shuffle()
//        var handReturns: [String: Bool] = [:]
//
//        let handOne = ChenHand(handArray: [deck.deal()!, deck.deal()!])
//        let handTwo = ChenHand(handArray: [deck.deal()!, deck.deal()!])
//        let handThree = ChenHand(handArray: [deck.deal()!, deck.deal()!])
//        let gameHands = [handOne, handTwo, handThree]
//        Logger.info.info("Game Run with: \(gameHands)")
//        var highestScore = handOne.handValue()
//        for hand in gameHands {
//            if hand.handValue() > highestScore {
//                highestScore = hand.handValue()
//            }
//
//        }
//
//        for hand in gameHands {
//            Logger.info.info("Hand Evaluated: \(hand)")
//
//            handReturns[hand.handString()] = hand.handValue() >= highestScore ? true : false //causes error
//            /*
//
//
//             LOGS
//             2022-05-27T21:39:53-0700 info Info : Game Run with: [Holdem_Trainer.ChenHand(handArray: [♣︎ 5, ♡ 7]), //Holdem_Trainer.ChenHand(handArray: [♡ 5, ♢ 7]), Holdem_Trainer.ChenHand(handArray: [♠︎ 4, ♢ 8])]
//             2022-05-27T21:39:53-0700 info Info : Hand Evaluated: ChenHand(handArray: [♣︎ 5, ♡ 7])
//             2022-05-27T21:39:53-0700 info Info : Hand Evaluated: ChenHand(handArray: [♡ 5, ♢ 7])
//             2022-05-27T21:39:53-0700 info Info : Hand Evaluated: ChenHand(handArray: [♠︎ 4, ♢ 8])
//             2022-05-27T21:39:53-0700 info Info : Run Game(): HandReturns ["48o": true, "57o": true]
//             2022-05-27T21:39:53-0700 info Info : Initializing Subviews with ["48o", "57o"]
//
//
//             The above line causes an error when multiple hands have the same hand string.
//             This is because the handString is the key for the HandReturns Dictionary, meaning that when
//             two hands have the same handString, the dictionary rewrites the previous value instead of adding
//             a new key value pair, creating a dictionary with only 2 elements.
//             */
//        }
//        Logger.info.info("Run Game(): HandReturns \(handReturns)")
//        return handReturns
//    }
//
//
//
//}

class ChenGuesserGame {
    func runGame(numberOfHands: Int) -> [ChenHand] {
        
        var handArray: [ChenHand] = []
        for _ in 0..<numberOfHands {
            var deck = Deck.standard52CardDeck()
            deck.shuffle()
            handArray.append(ChenHand(handArray: [deck.deal()!, deck.deal()!]))
        }
        Logger.info.info("Hands Generated: \(handArray)")
        return handArray
    }
    
    func checkValue(handArray: [ChenHand], chosenHand: ChenHand ) -> Bool {
        Logger.info.info("Hands Compared: \(handArray)")
        for hand in handArray {
            if (hand.handValue() > chosenHand.handValue()) {
                Logger.info.info("Highest Hand: \(hand)")
                return false
            }
                
        }
        Logger.info.info("Highest Hand: \(chosenHand)")
        return true
}
}
