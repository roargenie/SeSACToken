//
//  SubscriptExample.swift
//  SeSACWeek18
//
//  Created by 이명진 on 2022/11/03.
//

import Foundation


extension String {
    
    subscript(idx: Int) -> String? {
        
        guard (0..<self.count).contains(idx) else {
            return nil
        }
        
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
}

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

struct Phone {
    
    var numbers = ["1234", "5678", "1313", "1255"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
    
}








