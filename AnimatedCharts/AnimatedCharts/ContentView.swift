//
//  ContentView.swift
//  AnimatedCharts
//
//  Created by Dartrisen on 28.08.2020.
//  Copyright © 2020 LanguiDoge LLC. All rights reserved.
//

import SwiftUI

enum Item: Int, CaseIterable, Identifiable {
    case weekday = 0
    case afternoon = 1
    case evening = 2

    var id: Int { self.rawValue }
}

struct BarView: View {
    var value: CGFloat
    var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2961329222, green: 0.8958495259, blue: 0.719191432, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(text)
                .padding(.top, 8)
        }
    }
}

struct ContentView: View {
    @State private var pickerSelectedItem = Item.weekday
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150],
        [150, 100, 50],
        [10, 20, 30]
    ]
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.3672795892, green: 0.9590398669, blue: 0.773419559, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    
                Picker(selection: self.$pickerSelectedItem, label: Text("")) {
                    Text("Weekday").tag(Item.weekday)
                    Text("Afternoon").tag(Item.afternoon)
                    Text("Evening").tag(Item.evening)
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
            
                HStack(spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem.rawValue][0], text: "M")
                    BarView(value: dataPoints[pickerSelectedItem.rawValue][1], text: "T")
                    BarView(value: dataPoints[pickerSelectedItem.rawValue][2], text: "W")
                }
                    .padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
