//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Диана on 11.05.2023.
//

import Foundation

protocol StatisticService {
    func store(correct count: Int, total amount: Int)
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord { get }
}

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    static func compareRecords(oldRecord: GameRecord, newRecord: GameRecord) -> Bool {
        return newRecord.correct < oldRecord.correct
    }
    
    func conversionType() -> String {
        return "\(correct)/\(total) (\(date.dateTimeString))"
    }
}


    final class StatisticServiceImplementation: StatisticService {
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    

        func store(correct count: Int, total amount: Int) {
           
            let gameRecord = GameRecord(correct: count, total: amount, date: Date())
            
            let bestRecord = GameRecord.compareRecords(oldRecord: gameRecord, newRecord: bestGame)
                
            if bestRecord {
                bestGame = gameRecord
            }
                    
                    let correct = userDefaults.integer(forKey: Keys.correct.rawValue)
                    let total = userDefaults.integer(forKey: Keys.total.rawValue)
                    
                    let newCorrect = correct + count
                    let newTotal = total + amount
                    
                    userDefaults.set(newCorrect, forKey: Keys.correct.rawValue)
                    userDefaults.set(newTotal, forKey: Keys.total.rawValue)
                    userDefaults.set(gamesCount + 1, forKey: Keys.gamesCount.rawValue)
        }
        
        var totalAccuracy: Double {
            get {
                let correct = userDefaults.integer(forKey: Keys.correct.rawValue)
                let total = userDefaults.integer(forKey: Keys.total.rawValue)
                return (Double(correct) / Double(total)) * 100
            }
        }
        
        
        var gamesCount: Int {
            get {
                return userDefaults.integer(forKey: Keys.gamesCount.rawValue)
            }
            
            set {
                userDefaults.set(newValue, forKey: Keys.gamesCount.rawValue)
            }
        }
        
        
        var bestGame: GameRecord {
            get {
                guard let data = userDefaults.data(forKey: Keys.bestGame.rawValue),
                      let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                    return .init(correct: 0, total: 0, date: Date())
                }
                
                return record
            }
            
            set {
                guard let data = try? JSONEncoder().encode(newValue) else {
                    print("Невозможно сохранить результат.")
                    return
                }
                
                userDefaults.set(data, forKey: Keys.bestGame.rawValue)
            }
        }
        
    }
    



