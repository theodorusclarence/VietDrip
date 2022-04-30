//
//  IngredientsView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import SwiftUI

struct IngredientsView: View {
    @EnvironmentObject var appState: AppState
    @State private var coffeeGrounds: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredients").bold()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(appState.coffeeGrounds)gr")
                            .font(.system(size: 17))
                            .frame(width: 55, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text("Coffee")
                            Text("Medium grind")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                    HStack {
                        Text("\(appState.dripperSize.rawValue)mL")
                            .font(.system(size: 17))
                            .frame(width: 55, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text("Water")
                            Text("98°C")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                    }
                } //: VStack
            } //: ScrollView
            
            NavigationLink(destination: BrewingView()) {
                Text("Brew Now").foregroundColor(.orange)
            }.buttonStyle(.bordered)
        } //: VStack
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView().environmentObject(AppState())
    }
}
