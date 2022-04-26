//
//  OptionEnums.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import Foundation


enum DripperSize: Int, CaseIterable {
    // Size in miliLiters
    case small = 100
    case medium = 120
    case large = 150
}

enum Ratio: Int, CaseIterable {
    case light = 15
    case medium = 12
    case strong = 10
}
