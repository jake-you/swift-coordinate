//
//  DrawableFactory.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory{
    
     func createFigure(type:FigureType,points:[PointTuple]) throws ->Figure{
        switch type {
        case .none:
            throw Exception.ErrorType.wrongFormat
        case .point:
            return  MyPoint.init(points[0])
        case .line :
            return MyLine.init( MyPoint(points[0]),  MyPoint(points[1]))
        case .triangle:
            
            return MyTriangle.init(lineAB: <#T##MyLine#>, lineBC: <#T##MyLine#>, lineAC: <#T##MyLine#>)
            
        }
    }
}
