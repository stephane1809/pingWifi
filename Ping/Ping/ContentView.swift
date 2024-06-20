//
//  ContentView.swift
//  Ping
//
//  Created by Stephane Girão Linhares on 19/06/24.
//

import SwiftUI
import Network

struct ContentView: View {
//    let monitor: NWPathMonitor
//
//    public func startMonitoring() {
//        monitor.pathUpdateHandler = { path in
//            if path.status == .satisfied {
//                print("Internet connection is available.")
//                // Perform actions when internet is available
//            } else {
//                print("Internet connection is not available.")
//                // Perform actions when internet is not available
//            }
//        }
//    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! Let's go make a ping plugin S2")
        }
        .padding()
    }
}

final class NetworkMonitor {
    static let shered = NetworkMonitor()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public private(set) var isConnected: Bool = false


    private init() {
        monitor = NWPathMonitor()
    }

    public func startMonitoring() {

    }

    public func stopMonitoring() {
        monitor.cancel()
    }

}

#Preview {
    ContentView()
}
