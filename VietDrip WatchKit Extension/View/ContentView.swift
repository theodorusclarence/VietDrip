//
//  ContentView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Customize your cup").bold().font(.system(size: 16))
                
                List {
                    Picker("Dripper size", selection: $appState.dripperSize) {
                        HStack(alignment: .lastTextBaseline) {
                            Text("Small")
                            Text("(100mL)").font(.system(size: 12))
                        }.tag(DripperSize.small)
                        HStack(alignment: .lastTextBaseline) {
                            Text("Medium")
                            Text("(120mL)").font(.system(size: 12))
                        }.tag(DripperSize.medium)
                        HStack(alignment: .lastTextBaseline) {
                            Text("Large")
                            Text("(150mL)").font(.system(size: 12))
                        }.tag(DripperSize.large)
                    } //:Picker DripperSize
                    
                    Picker("Coffee Ratio", selection: $appState.ratio) {
                        HStack(alignment: .lastTextBaseline) {
                            Text("Light")
                            Text("(1:15)").font(.system(size: 12))
                        }.tag(Ratio.light)
                        HStack(alignment: .lastTextBaseline) {
                            Text("Medium")
                            Text("(1:12)").font(.system(size: 12))
                        }.tag(Ratio.medium)
                        HStack(alignment: .lastTextBaseline) {
                            Text("Strong")
                            Text("(1:10)").font(.system(size: 12))
                        }.tag(Ratio.strong)
                    } //:Picker Ratio
                } //:List
                
                NavigationLink(destination: IngredientsView(), label: {Text("Continue").foregroundColor(.orange)})
            }
        } //:VStack
        .id(appState.rootViewId)
    } //:NavigationView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState())
    }
}
