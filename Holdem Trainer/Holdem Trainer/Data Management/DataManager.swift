//
//  DataManager.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/15/22.
//

import Foundation
import GRDB

protocol GameScoreManagable {
    func getAll() -> [GameScore]
    func find(with name: String) -> GameScore? // return the first character attribute it can find or nothing at all
    func add(gameScore: GameScore)
    func update(gameScore: GameScore)
    func delete(gameScore: GameScore) -> Bool
}

class DataManager {
    // You can read/write/delete/find data using `DataManager.shared` and then the method you want to call.
    // This static property is what is called a singleton. There is only one of these as it's marked `static`
    // This means that you don't create an 'instance' of this class but rather use the one already provided
    static let shared = DataManager()
    private var db: DatabaseQueue!
    
    private init() {
        openDatabase()
        
        do {
            try migrator.migrate(db)
            print("DB Successfully migrated")
        } catch {
            print("Error migrating database. ", error)
        }
    }
}

// Here we are implementing the protocol written earlier.
// In this case I have actually gone deeper by making this implementation easy to reason about as well
// since GRDB (the database interface we are currently using) wants to expose a bunch of its
// guts for this all to work properly. But we want to write good clean code so we try and hide that as much as possible.
extension DataManager: GameScoreManagable {
    
    func getAll() -> [GameScore] {
        let records: [GameScore] = fetchAll()
        return records
    }
    
    func find(with name: String) -> GameScore? {
        let found: [GameScore] = find(key: "name", value: name)
        return found.first
    }
    
    func add(gameScore: GameScore) {
        var insertable = gameScore
        insert(row: &insertable)
    }
    
    func update(gameScore: GameScore) {
        update(row: gameScore)
    }
    
        func delete(gameScore: GameScore) -> Bool {
        var deletable = gameScore
        return delete(row: &deletable)
    }
}

// GRDB implementation
extension DataManager {
    
    private func openDatabase() {
        do {
             let databaseURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("db.sqlite")
            
            self.db = try DatabaseQueue(path: databaseURL.path)
        } catch {
            print("Error opening database", error)
            return
        }
        print("DB opened successfully")
    }

    // See https://github.com/groue/GRDB.swift/blob/master/README.md#migrations
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createGameScores") { db in
            // Create a table
            // See https://github.com/groue/GRDB.swift#create-tables
            try db.create(table: "gameScore") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("name", .text).notNull().collate(.localizedCaseInsensitiveCompare)
                t.column("attempts", .integer).notNull()
                t.column("correct", .integer).notNull()
            }
        }
        
        migrator.registerMigration("addGameScores") { db in
            let defaultScores = ["ChenGame", "PotOddsGame"]
            defaultScores.forEach { score in
                var gameScore = GameScore(name: score, attempts: 0, correct: 0)
                do {
                    try gameScore.insert(db)
                } catch {
                    print("Error in 'addGameScores' migration. Unable to add game score \(score). ", error)
                }
            }
        }
        
        //        // Migrations for future application versions will be inserted here:
        //        migrator.registerMigration(...) { db in
        //            ...
        //        }
        
        return migrator
    }
    
    internal func fetchAll<ClassType: TableRecord>() -> [ClassType] where ClassType: FetchableRecord {
        do {
            let rows = try self.db.read { db -> [ClassType] in
                let rows = try ClassType.fetchAll(db)
                return rows
            }
            return rows
        } catch {
            print("Unable to fetch \(ClassType.self). ", error)
            return []
        }
    }
    
    internal func find<ClassType: TableRecord>(key: String, value: String) -> [ClassType] where ClassType: FetchableRecord {
        do {
            let rows = try self.db.read { db -> [ClassType] in
                let rows = try ClassType.filter(Column(key) == value).fetchAll(db)
                return rows
            }
            return rows
        } catch {
            print("Unable to find \(ClassType.self) for \(key):\(value). ", error)
            return []
        }
    }
    
    internal func insert<ClassType: MutablePersistableRecord>(row: inout ClassType) {
        do {
            try self.db.write { db in
                try row.insert(db)
            }
        } catch {
            print("Unable to add \(ClassType.self) \(row). ", error)
        }
    }
    
    internal func update<ClassType: MutablePersistableRecord>(row: ClassType) {
        do {
            try self.db.write { db in
                try row.update(db)
            }
        } catch {
            print("Unable to update \(ClassType.self) \(row). ", error)
        }
    }
    
    internal func delete<ClassType: MutablePersistableRecord>(row: inout ClassType) -> Bool {
        do {
            let deleteSuccess = try self.db.write { db -> Bool in
                let success = try row.delete(db)
                return success
            }
            return deleteSuccess
        } catch {
            print("Unable to remove \(ClassType.self) \(row). ", error)
            return false
        }
    }
}
