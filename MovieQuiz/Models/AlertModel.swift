//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Диана on 05.05.2023.
//

import Foundation
import UIKit

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: ((UIAlertAction) -> Void)?
}
