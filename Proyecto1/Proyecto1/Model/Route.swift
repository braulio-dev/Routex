//
//  Ruta.swift
//  Proyecto1
//
//  Created by CETYS Universidad  on 19/02/25.
//

import SwiftUI

struct Route: Identifiable {
    let id = UUID()
    let title: String
    let timeStart: Date
    let timeEnd: Date
    let locationStart: Location
    let locationEnd: Location
    let image: UIImage?
}
