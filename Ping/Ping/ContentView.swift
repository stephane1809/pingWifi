//
//  ContentView.swift
//  Ping
//
//  Created by Stephane Girão Linhares on 19/06/24.
//

import SwiftUI
import Network

struct ContentView: View {
    func checkWifi() {
        NetworkMonitor.shered.startMonitoring()
    }
    init() {
        checkWifi()
    }

    func textConnection() -> String {
        var texto: String = ""
        if NetworkMonitor.shered.isConnected {
           return texto.appending("está conectado")
        } else {
           return texto.appending("NÃO está conectado")
        }
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(textConnection())")
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
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }

    public func stopMonitoring() {
        monitor.cancel()
    }

}

#Preview {
    ContentView()
}
