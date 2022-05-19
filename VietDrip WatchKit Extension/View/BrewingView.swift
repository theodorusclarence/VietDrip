//
//  BrewingView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import SwiftUI

enum BrewingStep: Int {
    case max = 5
}

struct BrewingView: View {
    @State private var selectedTab = 1
    @EnvironmentObject var appState: AppState

    @Environment(\.accessibilityReduceMotion) var reduceMotion

    var body: some View {
        TabView(selection: $selectedTab) {
            StepWithButton(selectedTab: $selectedTab, tab: 1) {
                AddCoffeeGroundsTabView()
            }.tag(1)

            StepWithButton(selectedTab: $selectedTab, tab: 2) {
                Group {
                    Text("Prefill your cup with ") +
                        Text("condensed milk").foregroundColor(.orange).bold() +
                        Text(" according to your preference. You can add ice too!")
                }.font(.system(size: 14))
            }.tag(2)

            StepWithButton(selectedTab: $selectedTab, tab: 3) {
                Group {
                    Text("Pour in ") +
                        Text("20mL of hot water ")
                        .foregroundColor(.orange)
                        .bold() +
                        Text("to bloom the coffee.")
                }.font(.system(size: 14))
            }.tag(3)

            StepWithButton(selectedTab: $selectedTab, tab: 4, withoutButton: true) {
                BloomTimerView(selectedTab: $selectedTab)
            }.tag(4)

            StepWithButton(selectedTab: $selectedTab, tab: 5) {
                Group {
                    Text("Let the coffee drips completely.\n") +
                        Text("Enjoy your vietnamese coffee!")
                        .foregroundColor(.orange)
                        .bold()
                }.font(.system(size: 14))
            }.tag(5)
        } //: TabView
        .tabViewStyle(.page(indexDisplayMode: .never))
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    withAnimation(reduceMotion ? nil : .easeInOut) {
                        appState.rootViewId = UUID()
                    }
                } label: {
                    Text("Cancel")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
        })
    }
}

struct BrewingView_Previews: PreviewProvider {
    static var previews: some View {
        BrewingView()
            .environmentObject(AppState())
    }
}
