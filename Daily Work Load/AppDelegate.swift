//
//  AppDelegate.swift
//  Daily Work Load
//
//  Created by Christopher Huffaker on 4/10/25.
//
import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    let tracker = AppTracker()
    var scheduler: DailyScheduler?

    func applicationDidFinishLaunching(_ notification: Notification) {
        scheduler = DailyScheduler(tracker: tracker)

        print("🌀 Daily Work Load tracking started.")
    }
}
