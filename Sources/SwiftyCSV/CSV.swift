public class CSV {
    
    /// MARK: - Public Read Only Fields
    public var rows: [[String]] {
        get {
            return internalRows
        }
    }
    
    /// The number of rows currently in the CSV.
    public var numberOfRows: Int {
        get {
            return rows.count
        }
    }
    
    /// The largest number of columns in a row in the CSV.
    public var numberOfColumns: Int {
        get {
            var maxNumberOfColumns = 0
            for row in rows {
                if row.count >= maxNumberOfColumns {
                    maxNumberOfColumns = row.count
                }
            }
            return maxNumberOfColumns
        }
    }
    
    /// A representation of the CSV object as a CSV string
    public var csvString: String {
        get {
            var csv = ""
            var firstPass = true
            
            for row in internalRows {
                // Add a new line for all rows after the first row
                if !firstPass {
                    csv += "\n"
                } else {
                    firstPass = false
                }
                
                for column in row {
                    // Perform sanitization on the row/column item.
                    csv += "\(csvItemSanitizer.sanitizeStringItem(column)),"
                }
                
                // Remove the trailing comma from the row, if present.
                if !csv.isEmpty { csv.removeLast() }
            }
            
            return csv
        }
    }
    
    // MARK: - Internal representation of the CSV
    private var internalRows: [[String]] = []
    
    // MARK: - Helpers
    private var csvItemSanitizer = CSVItemSanitizer()

    /**
     * Initialize a blank CSV.
     *
     * - Author: Will Taylor
     * - Date: 1/3/2020
     */
    public init(){}
    
   /**
    * Initialize a CSV with a row of strings.
    *
    * - Author: Will Taylor
    * - Date: 1/3/2020
    *
    * - Parameters:
    *       - firstRow: A variadic list of the items to be placed in the first row of the CSV.
    */
    public init(firstRow: String...) {
        Logger.i("Initializing new CSV with a first row of \(firstRow).")
        self.internalRows.append(firstRow)
    }
    
    init(fromCSV csv: String) {
        Logger.i("Initializing new CSV from existing CSV string.")
        for row in csv.split(separator: "\n") {
            var rowItems: [String] = []
            for rowItem in row {
                rowItems.append(csvItemSanitizer.sanitizeStringItem(String(rowItem)))
            }
            appendRow(values: rowItems)
        }
    }
    
    // MARK: - Public API
    
    public func appendRow(values: String...) {
        Logger.i("Inserting new row \(values).")
        internalRows.append(values)
    }
    
    public func appendRow(values: [String]) {
        Logger.i("Inserting new row \(values).")
        internalRows.append(values)
    }
    
    public func deleteRow(at rowIndex: Int){
        if rowIndex < internalRows.count {
            Logger.i("Deleting row at index \(rowIndex).")
            internalRows.remove(at: rowIndex)
        } else {
            Logger.w("Cannot delete row at index \(rowIndex) as it is out of bounds.")
        }
    }
}
