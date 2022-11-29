//  Log.swift
//  StreamCast

import Foundation
import SwiftUI

extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}

enum LogEvent: String {
    case error = "💥💥💥"
    case info = "ℹ️ℹ️ℹ️"
    case debug = "🛠🛠🛠"
    case verbose = "📣📣📣"
    case warning = "⚠️⚠️⚠️"
    case severe = "🔥🔥🔥"
}

struct Log {
    static private var dateFormat = "yyyy-MM-dd hh:mm"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private init() {}
    
    static func message(forEvent event: LogEvent, _ object: Any...,
                        filename: String = #file,
                        line: Int = #line,
                        funcName: String = #function) {
        #if DEBUG
        var objects = ""
        object.forEach({objects += "\($0) "})
        
        print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]: \(line) \(funcName) -> \(objects)")
        #endif
    }
    
    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    static func error(_ object: Any...) {
        message(forEvent: .error, object)
    }
    
    static func info(_ object: Any...) {
        message(forEvent: .info, object)
    }
    
    static func warning(_ object: Any...) {
        message(forEvent: .warning, object)
    }
    
    static func debug(_ object: Any...) {
        message(forEvent: .debug, object)
    }
    
    static func verbose(_ object: Any...) {
        message(forEvent: .verbose, object)
    }
    
    static func severe(_ object: Any...) {
        message(forEvent: .severe, object)
    }
}
