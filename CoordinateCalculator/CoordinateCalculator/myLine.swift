//
//  myLine.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// 두 좌표를 받아와서 거리를 계산하고 좌표 정보를 전달해주는 일을 책임지는 구조체
struct MyLine: ComputableFigure {
    private var pointA : MyPoint
    private var pointB : MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    public var points: [MyPoint] {
        return [pointA, pointB]
    }
    
    public func firstPoint() -> MyPoint {
        return self.pointA
    }
    
    // 거리를 계산하는 메소드
    public func compute() -> Double {
        let dx = pointA.xPoint()-pointB.xPoint(), dy = pointA.yPoint()-pointB.yPoint()
        let square = Double((dx * dx) + (dy * dy))
        let result = round(square.squareRoot()*1000) / 1000
        return result
    }
    
    public func computeMent() -> String {
        return "두 점 사이의 거리는 : "
    }
}