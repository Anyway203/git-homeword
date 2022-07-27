//
//  TodoInfo.swift
//  implement
//
//  Created by ESB17979 on 2022/6/22.
//

struct TodoInfo: Codable, Hashable {
    
    let resultCount:Int
    let results:[TodoInfoContent]
    

    enum CodingKeys:String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        resultCount = try container.decode(Int.self, forKey: .resultCount)

        results = try container.decode([TodoInfoContent].self, forKey: .results)
    }
}
struct TodoInfoContent: Codable, Hashable {
    var artworkUrl100: String?
    let trackName: String?
    let artistName: String?
    let kind: String
    let trackViewUrl: String?

    enum CodingKeys:String, CodingKey {
        case artworkUrl100 = "artworkUrl100"
        case trackName = "trackName"
        case artistName = "artistName"
        case kind = "kind"
        case trackViewUrl = "trackViewUrl"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
        trackName = try container.decode(String.self, forKey: .trackName)
        artistName = try container.decode(String.self, forKey: .artistName)
        kind = try container.decode(String.self, forKey: .kind)
        trackViewUrl = try container.decode(String.self, forKey: .trackViewUrl)
    }
}
