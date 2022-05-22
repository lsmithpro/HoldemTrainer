//
//  GameScore.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/22/22.
//



import Foundation
import GRDB

struct GameScore: Storable {
    // This property exists so that these objects can be saved/updated/deleted/fetched from a data store.
    // If we don't have a unique identifier for each attribute and you name an attribute the same as an
    // existing attribute, the original attribute would be overwritten
    // -----
    // You can treat this property as if it doesn't exist
    internal var id: Int64?
    
    // Properties that
    var name: String
    var attempts: Int
    var correct: Int
}

// Code needed to make GRDB work, this code can also be largely ignored as it's
// specific to the workings of GRDB and I was unable to hide this
// Pretend this doesn't exist
extension GameScore: Codable, FetchableRecord, MutablePersistableRecord {
    // Define database columns from CodingKeys
    private enum Columns {
        static let id = Column(CodingKeys.id)
        static let name = Column(CodingKeys.name)
        static let attempts = Column(CodingKeys.attempts)
        static let correct =  Column(CodingKeys.correct)
    }
    
    // Update an id after it has been inserted in the database.
    mutating func didInsert(with rowID: Int64, for column: String?) {
        id = rowID
    }
}
