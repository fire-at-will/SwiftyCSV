//
//  CSVItemSanitizer.swift
//
//  Responsible for sanitizing items to be contained in a CSV.
//
//  Created by Will Taylor on 1/9/20.
//

import Foundation
class CSVItemSanitizer: NSObject {
    
    /**
     * Sanitizes a string item in a matter such that they are consistent with the CSV format.
     *
     * - Author: Will Taylor
     * - Date: 1/9/2020
     *
     * In particular, this function applies the following rules:
     *
     * - Replaces double quotes `"` with two double quotes `""`
     * - If the string contains a comma, the string is surrounded by quotes.
     * - If the string contains a new line, the string is surrounded by quotes.
     *
     * - Parameters:
     *      - item: The string to be formatted.
     */
    func sanitizeStringItem(_ item: String) -> String {
        var formattedItem = item
        
        if formattedItem.contains("\"") {
            formattedItem = formattedItem.replacingOccurrences(of: "\"", with: "\"\"")
        }
        
        if formattedItem.contains(",") || formattedItem.contains("\n") {
            formattedItem = "\"\(formattedItem)\""
        }
        
        return formattedItem
    }
}
