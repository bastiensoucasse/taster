import Foundation

class Review {
    enum Grade: String {
        case F = "", E = "⭐️", D = "⭐️⭐️", C = "⭐️⭐️⭐️", B = "⭐️⭐️⭐️⭐️", A = "⭐️⭐️⭐️⭐️⭐️"
        
        static func all() -> [Grade] {
            return [ .A, .B, .C, .D, .E, .F ]
        }
    }
    
    var grade: Grade
    var review: String?
    
    init(_ grade: Grade, _ review: String? = nil) {
        self.grade = grade
        self.review = review
    }
    
    static let BASIC_A = Review(.A), BASIC_B = Review(.B), BASIC_C = Review(.C), BASIC_D = Review(.D), BASIC_E = Review(.E), BASIC_F = Review(.F)
}
