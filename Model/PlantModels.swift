import SwiftUI



// Define the data models :
struct Plant: Identifiable {
    var id = UUID()
    var name: String
    var room: PlantLocation // was String, now uses your enum
    var light: LightCondition      // "Full Sun" tag
    var days: WateringDays         // how often
    var amount: WateringAmount     // "20-50 ml" tag
    var isWatered: Bool = false    // fixed the spelling
    var wateredDate: Date? = nil
}

// light conditons difinetion useing enum wich fixed set of choices,, CaseItrerable : gives the full access of the list
enum LightCondition: String,CaseIterable,Codable{
    case full="Full Sun"
    case partial="Partial Sun"
    case low="Low Light"
}


// make the watering Days list
enum WateringDays:String,Codable,CaseIterable{
    case ED="Every Day"
    case E2D="Every 2 Days"
    case E3D="Every 3 Days"
    case oneW="Once a Week"
    case E10D="Every 10 Days"
    case E2W="Every 2 Weeks"
    case E10S="Every 10 Seconds"
    
    var seconds: TimeInterval {
        switch self {
        case .ED:   return 1 * 24 * 60 * 60
        case .E2D:  return 2 * 24 * 60 * 60
        case .E3D:  return 3 * 24 * 60 * 60
        case .oneW: return 7 * 24 * 60 * 60
        case .E10D: return 10 * 24 * 60 * 60
        case .E2W:  return 14 * 24 * 60 * 60
        case .E10S:  return 10
        }
    }
}
// list for the amount of water

enum WateringAmount:String,Codable,CaseIterable{
    case one="20-50 ml"
    case two="50-100 ml"
    case three="100-200 ml"
    case four="200-300 ml"
}

enum PlantLocation:String,Codable,CaseIterable{
    case bedroom="Bedroom"
    case livingroom="Livingroom"
    case kitchen="Kitchen"
    case balcony="Balcony"
    case bathroom="Bathroom"
}


