//
//  CSVRowTests.swift
//  
//
//  Created by Will Taylor on 1/3/20.
//

import Foundation
import XCTest
@testable import SwiftyCSV

final class CSVRowTests: XCTestCase {
    
    /**
     * Ensure that inserting a row works
     */
    func test_Insert_Row() {
        let csv = CSV()
        csv.appendRow(values: "mario", "and", "luigi")
        
        XCTAssertEqual(["mario", "and", "luigi"], csv.rows[0])
        XCTAssertEqual(1, csv.numberOfRows)
        XCTAssertEqual(3, csv.numberOfColumns)
    }
    
    /**
     * Ensure that deleting a row works.
     */
    func test_Delete_Row() {
        let csv = CSV()
        csv.appendRow(values: "mario", "and", "luigi")
        csv.deleteRow(at: 0)
        
        XCTAssertEqual(0, csv.rows.count)
        XCTAssertEqual(0, csv.numberOfRows)
        XCTAssertEqual(0, csv.numberOfColumns)
    }
    
    func test_Initialize_CSV_With_A_Row() {
        let csv = CSV(firstRow: "King Boo")
        XCTAssertEqual(["King Boo"], csv.rows[0])
        XCTAssertEqual(1, csv.numberOfRows)
        XCTAssertEqual(1, csv.numberOfColumns)
    }
    
    func test_Initialize_CSV_With_A_Row_And_Then_Append_A_Row() {
        let csv = CSV(firstRow: "King Boo")
        csv.appendRow(values: "Petey Piranha")
        
        XCTAssertEqual(["King Boo"], csv.rows[0])
        XCTAssertEqual(["Petey Piranha"], csv.rows[1])
        XCTAssertEqual(2, csv.numberOfRows)
        XCTAssertEqual(1, csv.numberOfColumns)
    }
}
