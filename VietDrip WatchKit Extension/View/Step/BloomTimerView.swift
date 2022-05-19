//
//  BloomTimerView.swift
//  VietDrip WatchKit Extension
//
//  Created by Clarence on 27/04/22.
//

import SwiftUI

enum AsyncState {
    case running, finish
}

struct BloomTimerView: View {
    @State private var time = 20
    @State private var notificationDate = Date()
    @State private var asyncState = AsyncState.running
    @Binding var selectedTab: Int

    @State private var brewTimer: Timer?
    @State private var session: WKExtendedRuntimeSession?

    @Environment(\.accessibilityReduceMotion) var reduceMotion

    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 8) {
                VStack(spacing: 2) {
                    Text("\(time >= 0 ? time : 0)")
                        .font(Font.custom("SF Mono", size: 30))
                        .foregroundColor(.white)
                        .bold()

                    Text("seconds remaining")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                } //: VStack
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )

                Group {
                    Text("Let's wait for the coffee grounds to ") +
                        Text("bloom!")
                        .foregroundColor(.orange)
                        .bold()
                }
                .font(.system(size: 14))
            } //: VStack
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            .onAppear {
                session = WKExtendedRuntimeSession()
                session?.start()
                brewTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if self.time > 0 {
                        self.time -= 1
                    } else if self.time > -5 {
                        WKInterfaceDevice.current().play(.success)
                        asyncState = .finish
                        self.time -= 1
                    }
                }
            }
            .onDisappear {
                brewTimer?.invalidate()
                session?.invalidate()
                time = 20
            }

            if asyncState == .running {
                Button("Bloom time!") {}
                    .disabled(true)
            } else if asyncState == .finish {
                Button("Next") {
                    withAnimation(reduceMotion ? nil : .easeInOut) {
                        selectedTab = selectedTab + 1
                    }
                }.foregroundColor(.orange)
            }
        } //: VStack
//        .onReceive(NotificationCenter.default.publisher(for: WKExtension.applicationWillResignActiveNotification)) { _ in
//            // Moving to the background
//            notificationDate = Date()
//        }
//        .onReceive(NotificationCenter.default.publisher(for: WKExtension.applicationDidBecomeActiveNotification)) { _ in
//            // Moving to the foreground
//            let deltaTime: Int = .init(Date().timeIntervalSince(notificationDate))
//            time -= deltaTime
//        }
    }
}

struct BloomTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            StepWithButton(selectedTab: .constant(4), tab: 4, withoutButton: true) {
                BloomTimerView(selectedTab: .constant(4))
                    .environmentObject(AppState())
            }
        }
    }
}
