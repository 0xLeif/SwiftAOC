import Foundation

protocol AOCSolvable {
    // MARK: Default Implemented
    static var fileURL: URL { get }
    static var answer: String { get }
    static func readInput() -> [String]
    
    // MARK: Needs Implementation
    static var day: String { get }
    static func solve(input: [String]) -> String
}

extension AOCSolvable {
    static var fileURL: URL {
        URL(fileURLWithPath: "./Inputs/Day_\(day)")
    }
    
    static var answer: String {
        solve(input: readInput())
    }
    
    static func readInput() -> [String] {
        print("Reading: \(fileURL)")
        
        do {
            return try String(contentsOf: fileURL, encoding: .utf8)
                .split(separator: "\n")
                .map(\.description)
        } catch {
            print(error)
            
            return []
        }
    }
}
