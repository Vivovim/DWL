//
//  Reportx.swift
//  Daily Work Load
//
//  Created by Christopher Huffaker on 4/10/25.
//
import Foundation
import SwiftUI
import AppKit


func reportX(tracker: AppTracker) {
    
    let usageLog = tracker.getUsageLog()
    
    let fileManager = FileManager.default
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let today = dateFormatter.string(from: Date())
    
    
    
    let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let folderURL = docsURL.appendingPathComponent("DailyWorkLoad")
    
    
    
    
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
    
//    summary += "\nFiles Touched:\n"
//    let changes = filesx
//    if changes.isEmpty {
//        summary += "- No files changed.\n"
//    } else {
//        for change in changes.prefix(20) {  // limit for readability
//            summary += "- \(change)\n"
//        }
//    }
    
    summary += "\nStay strong, keep building.\n"
    
    try? summary.write(to: fileURL, atomically: true, encoding: .utf8)
    print("Summary saved to: \(fileURL.path)")

    tracker.resetUsageLog()
    
}



func reportD(tracker: AppTracker) {
    
    let usageLog = tracker.getUsageLog()
    
    let fileManager = FileManager.default
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let today = dateFormatter.string(from: Date())
    
    
    
    let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let folderURL = docsURL.appendingPathComponent("DailyWorkLoad")
    
    
    
    
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
    
//    summary += "\nFiles Touched:\n"
//    let changes = filesx
//    if changes.isEmpty {
//        summary += "- No files changed.\n"
//    } else {
//        for change in changes.prefix(20) {  // limit for readability
//            summary += "- \(change)\n"
//        }
//    }
    
    summary += "\nStay strong, keep building.\n"
    
    try? summary.write(to: fileURL, atomically: true, encoding: .utf8)
    print("Summary saved to: \(fileURL.path)")

    
}



