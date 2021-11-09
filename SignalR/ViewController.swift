//
//  ViewController.swift
//  SignalR
//
//  Created by Lee on 11/8/21.
//

import UIKit
import SwiftSignalRClient

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SignalRService.init(url: "")
    }
}

public class SignalRService {
    private var connection: HubConnection
    
    public init(url: URL) {
        connection = HubConnectionBuilder(url: url).withLogging(minLogLevel: .error).build()
        connection.on(method: "MessageReceived", callback: { (user: String, message: String) in
            do {
                self.handleMessage(message, from: user)
            } catch {
                print(error)
            }
        })
        connection.start()
    }
    
    private func handleMessage(_ message: String, from user: String) {
        // Do something with the message.
    }
}
