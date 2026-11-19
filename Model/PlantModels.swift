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
    case EveryDay="Every Day"
    case Every2Day="Every 2 Days"
    case Every3Day="Every 3 Days"
    case oneWeek="Once a Week"
    case Every10Day="Every 10 Days"
    case Every2Week="Every 2 Weeks"
    case Every10Ssecond="Every 10 Seconds"
    
    var seconds: TimeInterval {
        switch self {
        case .EveryDay:   return 1 * 24 * 60 * 60
        case .Every2Day:  return 2 * 24 * 60 * 60
        case .Every3Day:  return 3 * 24 * 60 * 60
        case .oneWeek: return 7 * 24 * 60 * 60
        case .Every10Day: return 10 * 24 * 60 * 60
        case .Every2Week:  return 14 * 24 * 60 * 60
        case .Every10Ssecond:  return 10
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


