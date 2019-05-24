//
//  ShapeConverter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeConverter {
    private let numberParser: NumberParser
    private let validator: Validator
    
    init(numberParser: NumberParser, validator: Validator) {
        self.numberParser = numberParser
        self.validator = validator
    }
    
    enum Error: Swift.Error {
        case invalidFormat
        case invalidRange
        case exceedCoordinateCount
        case failedParsingCoordinates
        case failedCreatingShape
        
        var localizedDescription: String {
            switch self {
            case .invalidFormat:
                return "유효하지 않은 형식입니다."
            case .invalidRange:
                return "유효하지 않은 범위의 숫자입니다."
            case .exceedCoordinateCount:
                return "좌표 갯수를 초과하였습니다."
            case .failedParsingCoordinates:
                return "좌표 파싱에 실패하였습니다."
            case .failedCreatingShape:
                return "도형 생성에 실패하였습니다."
            }
        }
    }
    
    private func makePoint(from coordinate: String) throws -> MyPoint {
        guard validator.isValid(coordinate) else {
            throw ShapeConverter.Error.invalidFormat
        }
        let numbers = numberParser.parseNumbers(coordinate)
        guard numbers.count == 2 else {
            throw ShapeConverter.Error.failedParsingCoordinates
        }
        return MyPoint(x: numbers[0], y: numbers[1])
    }
    
    private func makeLine(from coordinateA: String, to coordinateB: String) throws -> MyLine {
        let pointA = try makePoint(from: coordinateA)
        let pointB = try makePoint(from: coordinateB)
        if let line = MyLine(pointA: pointA, pointB: pointB) {
            return line
        }
        throw ShapeConverter.Error.failedCreatingShape
    }
    
    private func makeTriangle(coordA: String, coordB: String, coordC: String) throws -> MyTriangle {
        let pointA = try makePoint(from: coordA)
        let pointB = try makePoint(from: coordB)
        let pointC = try makePoint(from: coordC)
        if let triangle = MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC) {
            return triangle
        }
        throw ShapeConverter.Error.failedCreatingShape
    }
    
    private func makeRect(coordA: String, coordB: String, coordC: String, coordD: String) throws -> MyRect {
        let pointA = try makePoint(from: coordA)
        let pointB = try makePoint(from: coordB)
        let pointC = try makePoint(from: coordC)
        let pointD = try makePoint(from: coordD)
        if let rect = MyRect(pointA: pointA, pointB: pointB, pointC: pointC, pointD: pointD) {
            return rect
        }
        throw ShapeConverter.Error.failedCreatingShape
    }
    
    func makeShape(_ coordinates: [String]) throws -> Shape {
        switch coordinates.count {
        case 1:
            return try makePoint(from: coordinates[0])
        case 2:
            return try makeLine(from: coordinates[0], to: coordinates[1])
        case 3:
            return try makeTriangle(coordA: coordinates[0], coordB: coordinates[1], coordC: coordinates[2])
        case 4:
            return try makeRect(coordA: coordinates[0], coordB: coordinates[1], coordC: coordinates[2], coordD: coordinates[3])
        default:
            throw ShapeConverter.Error.exceedCoordinateCount
        }
    }
}