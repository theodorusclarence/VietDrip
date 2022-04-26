//
//  IngredientsView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import SwiftUI

struct IngredientsView: View {
    var dripperSize: DripperSize
    var ratio: Ratio
    
    @State private var coffeeGrounds: Int = 0
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Ingredients").bold()
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(coffeeGrounds)gr")
                            .font(.system(size: 17))
                            .frame(width: 55, alignment: .leading)
                        VStack (alignment: .leading) {
                            Text("Coffee")
                            Text("Medium grind")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack {
                        Text("\(dripperSize.rawValue)mL")
                            .font(.system(size: 17))
                            .frame(width: 55, alignment: .leading)
                        VStack (alignment: .leading) {
                            Text("Water")
                            Text("98°C")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                } //:VStack
            } //:ScrollView
            
            NavigationLink(destinationName: "dummy") {
                Text("Brew Now").foregroundColor(.orange)
            }.buttonStyle(.bordered)
            
        } //:VStack
        .onAppear {
            coffeeGrounds = dripperSize.rawValue / ratio.rawValue
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(dripperSize: .large, ratio: .medium)
    }
}
