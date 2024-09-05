//
//  ContentView.swift
//  ColorPickerUsingSwiftUI
//
//  Created by Tamim Dari Chowdhury on 9/6/24.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var redColorValue: Double = 0.0
    @State private var greenColorValue: Double = 0.0
    @State private var blueColorValue: Double = 0.0
    @State private var curColor: Color = Color(red: 0, green: 0, blue: 0)
    
    private let gradient = AngularGradient(
        gradient: Gradient(colors: [Color.blue, .white]),
        center: .center,
        startAngle: .degrees(270),
        endAngle: .degrees(0))
    
    var body: some View {
        VStack{
            Text("Create a color and apply")
                .padding(.bottom, 50)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .foregroundStyle(.cyan)
            
            Circle()
                .overlay(
                    Circle()
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [.red, .blue, .green]), // Gradient colors
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.0 // Border width
                        )
                        .opacity(0.099)
                )
                .frame(width: 300, height: 300)
                .foregroundStyle(curColor)
                .padding(.bottom, 24)
            HStack{
                Text("Red")
                    .frame(width: 60)
                    .padding()
                    .foregroundStyle(.red)
                Slider(value: $redColorValue, in: 0...255)
                    .padding()
                    .tint(.red)
            }
            
            HStack{
                Text("Green")
                    .frame(width: 60)
                    .padding()
                    .foregroundStyle(.green)
                Slider(value: $greenColorValue, in: 0...255)
                    .padding()
                    .tint(.green)
            }
            HStack{
                Text("Blue")
                    .frame(width: 60)
                    .padding()
                    .foregroundStyle(.blue)
                Slider(value: $blueColorValue, in: 0...255)
                    .padding()
                    .tint(.blue)
            }
            
            Button("Apply Color"){
                curColor = Color(red: redColorValue/255.0, green: greenColorValue/255.0, blue: blueColorValue/255.0)
            }
            .buttonStyle(.borderedProminent)
            .padding(16)
            
            
        }
        
    }
}

struct ColorPickerView_preview: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
