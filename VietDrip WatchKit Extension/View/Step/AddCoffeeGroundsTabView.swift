//
//  AddCoffeeGroundsTabView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 27/04/22.
//

import SwiftUI

struct AddCoffeeGroundsTabView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("\(appState.coffeeGrounds)gr")
                    .font(.system(size: 15))
                    .frame(width: 45, alignment: .leading)
                VStack(alignment: .leading) {
                    Text("Coffee")
                        .font(.system(size: 15))
                    Text("Medium grind")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                }
            }

            Group {
                Text("Put your ") +
                    Text("coffee").foregroundColor(.orange).bold() +
                    Text(" inside the vietnam drip cup.") +
                    Text(" Then close the tamper")
            }
            .font(.system(size: 14))
        } //: VStack
    }
}

struct AddCoffeeGroundsTabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            StepWithButton(selectedTab: .constant(1), tab: 1) {
                AddCoffeeGroundsTabView()
                    .environmentObject(AppState())
            }
        }
    }
}
