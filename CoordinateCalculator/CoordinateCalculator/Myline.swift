//
//  Myline.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Drawable {
    var pointNumber: Int = 2
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA:MyPoint, pointB:MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
}