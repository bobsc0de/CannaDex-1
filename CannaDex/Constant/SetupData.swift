//
//  SetupData.swift
//  CannaDex
//
//  Created by Marwan Khalid on 3/7/22.
//

import UIKit

class SetupData {
    
    public static func getFilterData() -> [Filter]{
        var dataSoure = [Filter]()
        dataSoure.append(Filter(name: "Indica", check: false))
        dataSoure.append(Filter(name: "Sativa", check: false))
        dataSoure.append(Filter(name: "Hybrid", check: false))
        return dataSoure
    }
}
