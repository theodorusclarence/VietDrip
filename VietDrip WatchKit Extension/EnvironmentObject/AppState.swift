//
//  CupPreference.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 27/04/22.
//

import SwiftUI

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

class AppState: ObservableObject {
    @Published var dripperSize: DripperSize = .medium
    @Published var ratio: Ratio = .medium

    var coffeeGrounds: Int {
        return dripperSize.rawValue / ratio.rawValue
    }

    @Published var rootViewId = UUID()
}
