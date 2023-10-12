//
//  WeatherButtom.swift
//  swift_basics_tutorial
//
//  Created by Paloma St.Clair on 10/2/23.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    
    var body: some View{
            Text("Change Day Time")
                .frame(width: 300, height: 50)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}
