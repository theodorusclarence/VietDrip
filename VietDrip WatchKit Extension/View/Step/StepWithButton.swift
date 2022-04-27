//
//  StepWithButton.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 27/04/22.
//

import SwiftUI

struct StepWithButton<Content: View>: View {
    @Binding var selectedTab: Int
    var tab: Int
    var withoutButton = false
    var content: () -> Content
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            Text("\(tab) / \(BrewingStep.max.rawValue)")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
            VStack(content: content)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )
            
            if !withoutButton {
                if (selectedTab != BrewingStep.max.rawValue) {
                    Button("Next") {
                        withAnimation {
                            self.selectedTab = tab + 1
                        }
                    }
                } else {
                    Button("Finish") {
                        withAnimation {
                            appState.rootViewId = UUID()
                        }
                    }.foregroundColor(.orange)
                }
            }
        }
    }
}

struct StepWithButton_Previews: PreviewProvider {
    static var previews: some View {
        StepWithButton(selectedTab: .constant(1), tab: 1) {
            Text("Content")
        }
    }
}
