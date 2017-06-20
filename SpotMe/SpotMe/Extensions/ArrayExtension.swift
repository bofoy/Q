//
//  ArrayExtension.swift
//  SpotMe
//
//  Created by Dale Shin on 6/13/17.
//  Copyright © 2017 Dale Shin. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
    func next(item: Element) -> Element? {
        if let index = self.index(of: item), index + 1 < self.count {
            return self[index + 1]
        }
        return nil
    }
    
}
