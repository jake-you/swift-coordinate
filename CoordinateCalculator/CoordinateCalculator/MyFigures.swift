//
//  MyFigures.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyFigures {
    public struct MyPoint : Figure {
        var x = 0
        var y = 0
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(MyPoint(x: x, y: y))
            return points
        }
        
        public var description: String {
            return ""
        }
    }
    
    public struct MyLine : Figure {
        var p1 = MyPoint(x: 0, y: 0)
        var p2 = MyPoint(x: 0, y: 0)
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(p1)
            points.append(p2)
            return points
        }
        
        public var description: String {
            return "두 점 사이 거리는 \(calcDist())"
        }
        func calcDist() -> Float {
            let diffX = Double(p1.x - p2.x)
            let diffY = Double(p1.y - p2.y)
            return Float(sqrt(diffX*diffX + diffY*diffY))
        }
    }
    
    public struct MyTriangle : Figure {
        var lineAB = MyLine(p1: MyPoint(), p2: MyPoint())
        var lineBC = MyLine(p1: MyPoint(), p2: MyPoint())
        var lineAC = MyLine(p1: MyPoint(), p2: MyPoint())
        
        init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) throws {
            lineAB = MyLine(p1: pointA, p2: pointB)
            lineBC = MyLine(p1: pointB, p2: pointC)
            lineAC = MyLine(p1: pointA, p2: pointC)
            
            if(lineAB.calcDist() == 0 || lineBC.calcDist() == 0 || lineAC.calcDist() == 0) {
                throw InputView.InputError.InvalidTriangle
            }
        }
        
        func getPoints() -> [MyFigures.MyPoint] {
            var points = [MyPoint]()
            points.append(lineAB.p1)
            points.append(lineAB.p2)
            points.append(lineAC.p2)
            return points
        }
        
        public var description: String {
            return "삼각형 넓이는 \(calcArea())"
        }
        
        private func calcArea() -> Float {
            let distA = lineBC.calcDist()
            let distB = lineAC.calcDist()
            let distC = lineAB.calcDist()
            let cosB = (distA*distA + distC*distC - distB*distB) / (2*distA*distC)
            let sinB = sqrt(1 - pow(cosB, 2))

            return Float(distA * distC * sinB / 2)
        }
    }
    
    struct MyRect : Figure {
        var leftTop = MyPoint()
        var rightBottom = MyPoint()
        
        init(origin: MyPoint, size: CGSize) {
            //로직구현
        }
        
        func getPoints() -> [MyFigures.MyPoint] {
            return [MyPoint]()
        }
        
        var description: String {
            return ""
        }
    }
}


protocol Figure : CustomStringConvertible {
    func getPoints() -> [MyFigures.MyPoint]
}
