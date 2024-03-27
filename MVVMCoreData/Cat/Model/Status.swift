
import Foundation

struct Status: Codable {

  var verified  : Bool? = nil
  var sentCount : Int?  = nil

  enum CodingKeys: String, CodingKey {

    case verified  = "verified"
    case sentCount = "sentCount"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    verified  = try values.decodeIfPresent(Bool.self , forKey: .verified  )
    sentCount = try values.decodeIfPresent(Int.self  , forKey: .sentCount )
 
  }

  init() {

  }

}