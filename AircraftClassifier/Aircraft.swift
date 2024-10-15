//
//  Aircraft.swift
//  AircraftClassifier
//
//  Created by Doug Holland on 10/14/24.
//

import Foundation

enum Aircraft: String, CaseIterable {
    case f15 = "F-15"
    
    case f16 = "F-16"
    
    case f22 = "F-22"
    
    case f35 = "F-35"
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "f15":
            self = .f15
            
        case "f16":
            self = .f16
            
        case "f22":
            self = .f22
            
        case "f35":
            self = .f35
            
        default:
            return nil
        }
    }
    
    var name: String {
        switch self {
        case .f15:
            return "F-15 Eagle"
            
        case .f16:
            return "F-16 Fighting Falcon"
            
        case .f22:
            return "F-22 Raptor"
            
        case .f35:
            return "F-35 Lightning II"
        }
    }
}
