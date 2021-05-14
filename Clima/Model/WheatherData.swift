//
//  WheatherData.swift
//  Clima
//
//  Created by Igor Postnikov on 5/13/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WheaterData: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
    let pressure: Int
}
