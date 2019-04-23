//
//  OutView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row:25-point.y, col: point.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
    }
    func drawLine (_ line: MyLine) {
        print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row:25-line.pointA.y, col: line.pointA.x*2+3))•\(ANSICode.cursor.move(row:25-line.pointB.y, col: line.pointB.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
        print("\(ANSICode.text.whiteBright)두 점 사이의 거리는  \(line.length)")
    }
    func drawTriangle (_ triangle: MyTriangle) {
        print("\(ANSICode.text.yellowBright)\(ANSICode.cursor.move(row:25-triangle.lineAB.pointA.y, col: triangle.lineAB.pointA.x*2+3))•\(ANSICode.cursor.move(row:25-triangle.lineBC.pointA.y, col: triangle.lineBC.pointA.x*2+3))•\(ANSICode.cursor.move(row:25-triangle.lineAC.pointB.y, col: triangle.lineAC.pointB.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
        print("\(ANSICode.text.whiteBright)삼각형의 넓이는  \(triangle.area)")
    }
}
