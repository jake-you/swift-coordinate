//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by jake.you on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    private(set) var leftTop = MyPoint()
    private(set) var rightBottom = MyPoint()
    
    private var leftBottom: MyPoint {
        return MyPoint(x: leftTop.x, y: rightBottom.y)
    }
    
    private var rightTop: MyPoint {
        return MyPoint(x: rightBottom.x , y: leftTop.y)
    }

    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height) )
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) {
        var points = [pointA, pointB, pointC, pointD]
        let originX = points.sort { $0.x < $1.x }
    }
    
    var extent: Double {
        return MyLine(x: leftTop, y: rightTop).distance * MyLine(x: leftTop, y: leftBottom).distance
    }
}

extension MyRect: Shape {
    var vertices: [CoordinatePresentable] {
        return [leftTop, rightTop, leftBottom, rightBottom]
    }
    
    var description: String? {
        return "사각형의 넓이는:\(extent)"
    }
}


