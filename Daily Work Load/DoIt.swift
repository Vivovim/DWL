//
//  DoIt.swift
//  Daily Work Load
//
//  Created by Christopher Huffaker on 4/10/25.
//

import Foundation
import AppKit



class AppTracker {
    private var currentApp: String?
    private var startTime: Date?
    private var usageLog: [String: TimeInterval] = [:]
    
    init() {
        NSWorkspace.shared.notificationCenter.addObserver(
            self,
            selector: #selector(appSwitched),
            name: NSWorkspace.didActivateApplicationNotification,
            object: nil
        )
        
        // Start tracking the current app on launch
        if let frontApp = NSWorkspace.shared.frontmostApplication?.localizedName {
            currentApp = frontApp
            startTime = Date()
        }
    }
    
    
    
    
    @objc func appSwitched(notification: Notification) {
        let now = Date()
        
        if let currentApp = currentApp, let start = startTime {
            let duration = now.timeIntervalSince(start)
            usageLog[currentApp, default: 0] += duration
        }
        
        // Update to the new active app
        if let newApp = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication {
            currentApp = newApp.localizedName
            startTime = now
        }
    }
    
    func printUsageSummary() {
        print("Daily App Usage Summary:")
        for (app, time) in usageLog {
            let minutes = Int(time) / 60
            print("- \(app): \(minutes) minutes")
        }
    }
    
    
    func getUsageLog() -> [String: TimeInterval] {
        return usageLog
    }
    
    func resetUsageLog() {
        usageLog.removeAll()
    }
    
}

class DailyScheduler {
    var timer: Timer?
    var tracker: AppTracker


    
    
    
    init(tracker: AppTracker) {
        self.tracker = tracker
    
          // Starts the scheduled timer for daily report
          timer = Timer.scheduledTimer(withTimeInterval: 45, repeats: true) { _ in
              self.checkTimeForReport()
          }
      }
    
    func checkTimeForReport() {
           let now = Date()
           let calendar = Calendar.current
           let hour = calendar.component(.hour, from: now)
           let minute = calendar.component(.minute, from: now)

           if hour == 23 && minute == 59 {
               self.generateReport()
           }
       }
    
    
    // (keep rest of scheduler code same...)

    func generateReport() {
        let usageLog = tracker.getUsageLog()
        let fileManager = FileManager.default
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: Date())

        let folderURL = fileManager.homeDirectoryForCurrentUser
            .appendingPathComponent("Documents")
            .appendingPathComponent("DailyWorkLoad")

        if !fileManager.fileExists(atPath: folderURL.path) {
            try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }

        let fileURL = folderURL.appendingPathComponent("DailySummary_\(today).txt")

        var summary = "=== Daily Work Load Summary ===\nDate: \(today)\n\n"

        summary += "App Usage:\n"
        for (app, time) in usageLog {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            summary += "- \(app): \(minutes)m \(seconds)s\n"
        }

   //     summary += "\nFiles Touched:\n"
   //     let changes = folderWatcher.getChanges()
   //     if changes.isEmpty {
   //         summary += "- No files changed.\n"
   //     } else {
   //         for change in changes.prefix(20) {  // limit for readability
   //             summary += "- \(change)\n"
   //         }
   //     }

        summary += "\nStay strong, keep building.\n"

        try? summary.write(to: fileURL, atomically: true, encoding: .utf8)
        print("Summary saved to: \(fileURL.path)")
        
        
        tracker.resetUsageLog()
    
    }
    

    
}



let tracker = AppTracker()



