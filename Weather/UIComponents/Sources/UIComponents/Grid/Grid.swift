//
//  Grid.swift
//  
//
//  Created by Helga on 30.11.22.
//

import UIKit

public protocol Grid {
    static var gridUnitSize: CGSize { get }
}

public extension Grid {

    static var gridUnitSize: CGSize { return CGSize(4) }

    static var xxs: CGFloat { return 1 }
    static var xs: CGFloat { return 2 }
    static var s: CGFloat { return 4 }
    static var m: CGFloat { return 6 }
    static var l: CGFloat { return 8 }
    static var xl: CGFloat { return 12 }
    static var xxl: CGFloat { return 16 }
    static var xxxl: CGFloat { return 24 }
    static var xxxxl: CGFloat { return 36 }


    var xxsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxs) }
    var xsSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xs) }
    var sSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.s) }
    var mSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.m) }
    var lSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.l) }
    var xlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xl) }
    var xxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxl) }
    var xxxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxl) }
    var xxxxlSpace: CGFloat { return Self.gridUnitSize.height * CGFloat(Self.xxxxl) }


    static var xxsSpace: CGFloat { return gridUnitSize.height * CGFloat(xxs) }
    static var xsSpace: CGFloat { return gridUnitSize.height * CGFloat(xs) }
    static var sSpace: CGFloat { return gridUnitSize.height * CGFloat(s) }
    static var mSpace: CGFloat { return gridUnitSize.height * CGFloat(m) }
    static var lSpace: CGFloat { return gridUnitSize.height * CGFloat(l) }
    static var xlSpace: CGFloat { return gridUnitSize.height * CGFloat(xl) }
    static var xxlSpace: CGFloat { return gridUnitSize.height * CGFloat(xxl) }
    static var xxxlSpace: CGFloat { return gridUnitSize.height * CGFloat(xxxl) }
    static var xxxxlSpace: CGFloat { return gridUnitSize.height * CGFloat(xxxxl) }

    var sSize: CGSize { return Self.gridUnitSize * Self.s }


    static var xxsSize: CGSize { return gridUnitSize * xxs }
    static var xsSize: CGSize { return gridUnitSize * xs }
    static var sSize: CGSize { return gridUnitSize * s }
    static var mSize: CGSize { return gridUnitSize * m }
    static var lSize: CGSize { return gridUnitSize * l }
    static var xlSize: CGSize { return gridUnitSize * xl }
    static var xxlSize: CGSize { return gridUnitSize * xxl }
    static var xxxlSize: CGSize { return gridUnitSize * xxxl }
    static var xxxxlSize: CGSize { return gridUnitSize * xxxxl }

    var pixelSize: CGFloat { return 1 / UIScreen.main.scale }
}

extension CGSize {

    init(_ size: CGFloat) {
        self.init(width: size, height: size)
    }

    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}

