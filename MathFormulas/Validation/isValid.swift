//
//  isValid.swift
//  MathFormulas
//
//  Created by Krzysztof Zaporowski on 25/02/2026.
//

import Foundation

enum isValid {
    case success
    case failure(String)
    
    var errorMessage: String? {
        switch self {
        case .success:
            return nil
        case .failure(let message):
            return message
        }
    }
}

func validateNumFields(number: Double?) -> isValid {
    guard let n = number else {
        return .failure("Pole nie może być puste")
    }
    if n < 0 {
        return .failure("Wartość musi być większa niż 0")
    }
    
    return .success
}
