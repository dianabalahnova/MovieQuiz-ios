//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Диана on 04.05.2023.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer() 
    func didFailToLoadData(with error: Error)
}
