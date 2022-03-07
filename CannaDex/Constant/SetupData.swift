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
    
    public static func getGlossaryData() ->[Glossary]{
        var dataSoure = [Glossary]()
        dataSoure.append(Glossary(hex: "#001", name: "White Widow", category: "Indica", rating: "4", categImage: "indica", favorite: false))
        dataSoure.append(Glossary(hex: "#002", name: "Amnesia Haze", category: "Sativa", rating: "2", categImage: "sativa", favorite: false))
        dataSoure.append(Glossary(hex: "#003", name: "Skunk 1 Auto", category: "Hybrid", rating: "5", categImage: "hybrid", favorite: false))
        return dataSoure
    }
    
    public static func getTop10Data() ->[Top10]{
        var dataSource = [Top10]()
        dataSource.append(Top10(name: "Top 10 Indica", image: "budherd-team-Jx8pRS_j8kk-unsplash"))
        dataSource.append(Top10(name: "Top 10 Sativa", image: "placeholder_sorts_image"))
        dataSource.append(Top10(name: "Top 10 Ruderalis", image: "placeholder_sorts_image2)"))
        return dataSource
    }
    
}

struct Top10 {
    let name:String
    let image:String
}
