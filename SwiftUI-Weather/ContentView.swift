//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Muhammad Arslan Nasr on 31/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    
    var body: some View {
        
        ZStack{
            
            BackgroundView(isNight: isNight)
            
            
            VStack{
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temparature: 76)
                
                HStack(spacing: 20){
                    WeatherDayView(
                    dayofWeek: "TUE", imageName: "cloud.sun.fill", temparature: 74)
                    
                    WeatherDayView(
                    dayofWeek: "WED", imageName: "sun.max.fill", temparature: 88)
                    
                    WeatherDayView(
                    dayofWeek: "THU", imageName: "wind.snow", temparature: 55)
                    
                    WeatherDayView(
                    dayofWeek: "FRI", imageName: "sunset.fill", temparature: 60)
                    
                    WeatherDayView(
                    dayofWeek: "SAT", imageName: "snow", temparature: 25)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: Color.white)
                    
                }
                
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayofWeek: String
    var imageName: String
    var temparature: Int
    var body: some View {
        VStack{
            Text(dayofWeek).font(.system(size: 16, weight: .medium)).foregroundColor(.white)
            
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48,height: 48)
            
            Text("\(temparature)°").font(.system(size: 20,weight:.medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
   
   var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temparature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(temparature)°").font(.system(size: 70,weight:.medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
