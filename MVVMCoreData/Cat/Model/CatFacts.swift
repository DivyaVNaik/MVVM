
import Foundation

struct CatFacts: Codable, Identifiable {
    var id: UUID = UUID()

  var status    : Status? = Status()
  var Id        : String? = nil
  var user      : String? = nil
  var text      : String? = nil
  var _v        : Int?    = nil
  var source    : String? = nil
  var updatedAt : String? = nil
  var type      : String? = nil
  var createdAt : String? = nil
  var deleted   : Bool?   = nil
  var used      : Bool?   = nil

  enum CodingKeys: String, CodingKey {

    case status    = "status"
    case Id        = "_id"
    case user      = "user"
    case text      = "text"
    case _v        = "__v"
    case source    = "source"
    case updatedAt = "updatedAt"
    case type      = "type"
    case createdAt = "createdAt"
    case deleted   = "deleted"
    case used      = "used"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status    = try values.decodeIfPresent(Status.self , forKey: .status    )
    Id        = try values.decodeIfPresent(String.self , forKey: .Id        )
    user      = try values.decodeIfPresent(String.self , forKey: .user      )
    text      = try values.decodeIfPresent(String.self , forKey: .text      )
    _v        = try values.decodeIfPresent(Int.self    , forKey: ._v        )
    source    = try values.decodeIfPresent(String.self , forKey: .source    )
    updatedAt = try values.decodeIfPresent(String.self , forKey: .updatedAt )
    type      = try values.decodeIfPresent(String.self , forKey: .type      )
    createdAt = try values.decodeIfPresent(String.self , forKey: .createdAt )
    deleted   = try values.decodeIfPresent(Bool.self   , forKey: .deleted   )
    used      = try values.decodeIfPresent(Bool.self   , forKey: .used      )
 
  }

    init(text: String, type: String = "Cat") {
        self.id = UUID()
        self.text = text
        self.type = type

  }

}
