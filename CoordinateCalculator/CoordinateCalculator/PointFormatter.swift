//
//  PointFormatter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointFormatter {
    
    enum Error: Swift.Error {
        case invalidFormat
        case invalidRange
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            case .invalidRange:
                return "유효하지 않은 범위의 숫자입니다."
            }
        }
    }
    
    static func isValidCoordinate(_ input: String) -> Bool {
        let regex = "\\(-?[\\d]+,-?[\\d]+\\)"
        return input.matches(regex)
    }
    
    static private func validateRange(_ number: Int) throws {
        guard (0...24).contains(number) else {
            throw PointFormatter.Error.invalidRange
        }
    }
    
    static private func parseNumbers(_ input: String) throws -> [Int] {
        let regex = "-?[0-9]+"
        let numbers = input.matches(for: regex)
        return numbers.compactMap { Int($0) }
    }
    
    static func point(from input: String) throws -> MyPoint {
        guard isValidCoordinate(input) else {
            throw PointFormatter.Error.invalidFormat
        }
        let numbers = try parseNumbers(input)
        return MyPoint(x: numbers[0], y: numbers[1])
    }
}