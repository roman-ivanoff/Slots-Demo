//
//  ContentView.swift
//  Slots Demo
//
//  Created by Roman Ivanov on 17.01.2023.
//

import SwiftUI

struct ContentView: View {

    private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var betAmount = 5

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Slots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)

                Spacer()
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(.white.opacity(0.5))
                    .cornerRadius(20)

                Spacer()
                HStack {
                    Spacer()
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        . cornerRadius(20)
                    Image(symbols[numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        . cornerRadius(20)
                    Image(symbols[numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(.white.opacity(0.5))
                        . cornerRadius(20)
                    Spacer()
                }
                Spacer()
                Button {
                    numbers[0] = Int.random(in: 0...symbols.count-1)
                    numbers[1] = Int.random(in: 0...symbols.count-1)
                    numbers[2] = Int.random(in: 0...symbols.count-1)

                    if numbers[0] == numbers[1] && numbers[1] == numbers[2] {
                        credits += betAmount * 10
                    } else {
                        credits -= betAmount 
                    }
                } label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(.pink)
                        .cornerRadius(20)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
