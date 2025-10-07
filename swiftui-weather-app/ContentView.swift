//
//  ContentView.swift
//  swiftui-weather-app
//
//  Created by Ikenna Umeh on 02/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
             
            BackgroundView(isNight:  isNight)
            
            VStack{
                 
                CityNameView(
                    cityName: "Cupertino, CA"
                )
                
                WeatherStatus(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 40
                )
                HStack {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 5
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 88
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 55
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 60
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT ",
                        imageName: "snow",
                        temperature: 25
                    )
                 
                }
                  
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white
                    )
                     
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
 

struct WeatherDayView : View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: [isNight ? .black  : .blue, isNight ? .gray : Color("lightBlue")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing,
        ).ignoresSafeArea(.all)
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium,))
            .foregroundStyle(.white)
            .padding()
    }
}

struct WeatherStatus: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40 )
    }
}
