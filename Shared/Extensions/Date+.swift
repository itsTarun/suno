//  Date+.swift
//  StreamCast

import Foundation

extension Date {
    func format(_ format: String = "d MM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  format
        formatter.locale = .autoupdatingCurrent
        let component = formatter.string(from: self)
        return component
    }
}
