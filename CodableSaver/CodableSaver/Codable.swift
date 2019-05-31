//
//  Codable.swift
//  Snap
//
//  Created by 程晓龙 on 2019/5/14.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import Foundation
extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}
