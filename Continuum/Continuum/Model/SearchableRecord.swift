//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Michael Di Cesare on 10/16/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
