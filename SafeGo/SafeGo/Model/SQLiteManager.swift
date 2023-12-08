//
//  SQLiteManager.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 8/12/23.
//

import Foundation
import SQLite

class SQLiteManager {
    static let shared = SQLiteManager()

    private var db: Connection?

    private let usersTable = Table("users")
    private let userId = Expression<String>("id")
    private let userName = Expression<String>("name")
    // Add other user properties as needed

    private let bugsTable = Table("bugs")
    private let bugId = Expression<Int64>("id")
    private let bugDescription = Expression<String>("description")
    // Add other bug properties as needed

    private init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!

            db = try Connection("\(path)/db.sqlite3")

            try createUsersTable()
            try createBugsTable()
        } catch {
            print("Error initializing SQLite: \(error)")
        }
    }

    private func createUsersTable() throws {
        try db?.run(usersTable.create(ifNotExists: true) { table in
            table.column(userId, primaryKey: true)
            table.column(userName)
            // Add other user properties as needed
        })
    }

    private func createBugsTable() throws {
        try db?.run(bugsTable.create(ifNotExists: true) { table in
            table.column(bugId, primaryKey: .autoincrement)
            table.column(bugDescription)
            // Add other bug properties as needed
        })
    }

    func insertUser(user: User) {
        do {
            let insert = usersTable.insert(
                userId <- user.id,
                userName <- user.name
                // Add other user properties as needed
            )
            try db?.run(insert)
        } catch {
            print("Error inserting user into SQLite: \(error)")
        }
    }

    func insertBug(description: String) {
        do {
            let insert = bugsTable.insert(
                bugDescription <- description
                // Add other bug properties as needed
            )
            try db?.run(insert)
        } catch {
            print("Error inserting bug into SQLite: \(error)")
        }
    }
}

