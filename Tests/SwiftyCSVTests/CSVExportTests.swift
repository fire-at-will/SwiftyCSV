//
//  CSVExportTests.swift
//  
//
//  Created by Will Taylor on 1/3/20.
//

import Foundation
import XCTest
@testable import SwiftyCSV

final class CSVExportTests: XCTestCase {
    
    /**
     * Ensure that the CSV string for a blank CSV object is an empty string.
     */
    func test_Export_Blank_CSV() {
        let csv = CSV()
        let csvString = csv.csvString
        
        XCTAssertEqual("", csvString)
    }
        
    /**
     * Ensure that the CSV string for a CSV object with one row is a one line
     * CSV with the correct values.
     */
    func test_Export_CSV_With_One_Rows() {
        let item1 = "Bowser"
        let item2 = "Waluigi"
        let item3 = "Wario"
        let item4 = "K Rool"
        
        let expectedCSVString = "\(item1),\(item2),\(item3),\(item4)"
        
        let csv = CSV()
        csv.appendRow(values: item1, item2, item3, item4)
        let actualCSVString = csv.csvString
        
        XCTAssertEqual(expectedCSVString, actualCSVString)
    }
    
    /**
     * Ensure that the CSV string for a CSV object with one row is a one line
     * CSV with the correct values.
     */
    func test_Export_CSV_With_Multiple_Rows() {
        let row0Item0 = "Bowser"
        let row0Item1 = "Waluigi"
        let row0Item2 = "Wario"
        let row0Item3 = "K Rool"
        let row0 = "\(row0Item0),\(row0Item1),\(row0Item2),\(row0Item3)"
        
        let row1Item0 = "Ganondorf"
        let row1Item1 = "Girihaim"
        let row1Item2 = "Vaati"
        let row1Item3 = "Zant"
        let row1 = "\(row1Item0),\(row1Item1),\(row1Item2),\(row1Item3)"
        
        let row2Item0 = "Waka"
        let row2Item1 = "Lechku and Nechku"
        let row2Item2 = "Orochi"
        let row2Item3 = "Ninetails"
        let row2 = "\(row2Item0),\(row2Item1),\(row2Item2),\(row2Item3)"

        let expectedCSVString = "\(row0)\n\(row1)\n\(row2)"
        
        let csv = CSV(firstRow: row0Item0, row0Item1, row0Item2, row0Item3)
        csv.appendRow(values: row1Item0, row1Item1, row1Item2, row1Item3)
        csv.appendRow(values: row2Item0, row2Item1, row2Item2, row2Item3)
        let actualCSVString = csv.csvString
        
        XCTAssertEqual(expectedCSVString, actualCSVString)
    }
}
