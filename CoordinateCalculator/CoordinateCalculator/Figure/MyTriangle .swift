//
//  MyTriangle .swift
//  CoordinateCalculator
//
//  Created by 이동영 on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Figure{
   
    private(set) var lineAB :MyLine
    private(set) var lineBC :MyLine
    private(set) var lineAC :MyLine
    
    // 로직 구현
    func getPoints() -> [MyPoint] {
        var points = [MyPoint]()
        points.append(contentsOf: lineAB.getPoints())
        points.append(contentsOf: lineBC.getPoints())
        points.append(contentsOf: lineAC.getPoints())
        return points
    }
    
}

