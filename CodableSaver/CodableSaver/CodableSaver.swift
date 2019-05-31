//
//  ObjectSaver.swift
//  Snap
//
//  Created by 程晓龙 on 2019/5/31.
//  Copyright © 2019 程晓龙. All rights reserved.
//

import UIKit

class CodableSaver {
    @discardableResult static func save(object:Codable,key:String) -> Bool {
        let mmkv = MMKV(mmapID: "com.becomedragon.mmkv")
        do {
            let data = try object.encode() as NSData
            mmkv?.set(data, forKey:key)
            return true
        } catch {
            return false
        }
    }
    
    static func value<T:Codable>(type:T.Type,key:String) -> T? {
        let mmkv = MMKV(mmapID: "com.becomedragon.mmkv")
        guard let nsdata = mmkv?.object(of: NSData.self, forKey:key) as? NSData else {
            return nil
        }
        let data = Data(referencing: nsdata)
        do {
            let model = try type.decode(from: data)
            return model
        } catch {
            return nil
        }
    }
}
