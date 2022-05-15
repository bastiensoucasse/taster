import Foundation

struct Review: Codable {
    enum Grade: String, Codable {
        case F = "⁄", E = "⭐️", D = "⭐️⭐️", C = "⭐️⭐️⭐️", B = "⭐️⭐️⭐️⭐️", A = "⭐️⭐️⭐️⭐️⭐️"
        static func all() -> [Grade] { return [ .A, .B, .C, .D, .E, .F ] }
    }
    
    var grade: Grade
    var opinion: String
    
    init(_ grade: Grade, _ opinion: String = "") {
        self.grade = grade
        self.opinion = opinion
    }
    
    static let A = Review(.A), B = Review(.B), C = Review(.C), D = Review(.D), E = Review(.E), F = Review(.F)
}
