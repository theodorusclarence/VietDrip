//
//  RestOfWaterView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 27/04/22.
//

import SwiftUI

struct RestOfWaterView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack (spacing: 10) {
            HStack {
                Text("\(appState.dripperSize.rawValue - 20)mL")
                    .font(.system(size: 15))
                    .frame(width: 48, alignment: .leading)
                VStack (alignment: .leading) {
                    Text("Water")
                        .font(.system(size: 15))
                    Text("98° C")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary)
                }
            }
            
            Group {
                Text("Pour ") +
                Text("the rest of your water").foregroundColor(.orange).bold() +
                Text(" to the vietnam drip.") +
                Text("")
            }
            .font(.system(size: 14))
        } //:VStack
    }
}

struct RestOfWaterView_Previews: PreviewProvider {
    static var previews: some View {
        StepWithButton (selectedTab: .constant(5), tab: 5) {
            RestOfWaterView()
                .environmentObject(AppState())
        }
    }
}
