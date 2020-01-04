//
//  File.swift
//  
//
//  Created by Will Taylor on 1/3/20.
//

import Foundation
class Logger {
    
    /// Determines whether or not logs are outputted. Set to `true` to silence all logs.
    public static var silent = false
    
    internal static func i(_ message: String) {
        Logger.log(message, level: .INFO)
    }
    
    internal static func d(_ message: String) {
        Logger.log(message, level: .DEBUG)
    }
    
    internal static func w(_ message: String) {
        Logger.log(message, level: .WARN)
    }
    
    internal static func e(_ message: String) {
        Logger.log(message, level: .ERROR)
    }
    
    internal static func wtf(_ message: String) {
        Logger.log(message, level: .WTF)
    }
    
    internal static func log(_ message: String, level: LogLevel) {
        if !silent {
            print("[SwiftyCSV] \(level.rawValue): \(message)")
        }
    }
}

internal enum LogLevel: String {
    case INFO = "i"
    case DEBUG = "d"
    case WARN = "w"
    case ERROR = "e"
    case WTF = "🚨WTF🚨"
}
