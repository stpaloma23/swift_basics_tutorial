//
//  ContentView.swift
//  swift_basics_tutorial
//
//  Created by Paloma St.Clair on 9/29/23.
//
// Topics: binding, state, hstack, vstack, zstack, refactoring code, conditional
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    // setting up ui to handle the state
    @State private var isNight = false
    
    
    var body: some View {
        
        ZStack{
//            BackgroundView(topColor: isNight ? .black : .blue,
//                        bottomColor: isNight ? .gray : Color("lightBlue"))
            // $ passes it as a binding variable
            BackgroundView(isNight: $isNight)
            VStack (spacing: 10){
                CityTextView(cityName: "Cupertino, CA")
                
                VStack{
                    TodayWeatherView(temp: 76, imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                }
                .padding(.bottom, 40)
        
                
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE", weatherIcon: "sun.max.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", weatherIcon: "wind.snow", temperature: 60)
                    WeatherDayView(dayOfWeek: "THU", weatherIcon: "cloud.drizzle.fill", temperature: 68)
                    WeatherDayView(dayOfWeek: "FRI", weatherIcon: "cloud.rain.fill", temperature: 63)
                    WeatherDayView(dayOfWeek: "SAT", weatherIcon: "cloud.heavyrain.fill", temperature: 73)
                    WeatherDayView(dayOfWeek: "SUN", weatherIcon: "cloud.sun.fill", temperature: 71)
                }
                Spacer() // brings the elemnets to the top of the page
                
                Button{
                    print("tapped")
                    isNight.toggle()
                } label: {
                    Text(isNight ? "Day Mode" : "Night Mode")
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
                
            }
        }
        
    }
        
    }

     
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherIcon: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight:.medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size:22, weight:.medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View{
    @Binding var isNight:Bool
    
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                          isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}
struct CityTextView: View {
    var cityName:String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    var temp: Int
    var imageName: String
    
    var body: some View {
        Image(systemName:imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        Text("\(temp)°")
            .font(.system(size:60, weight:.bold, design: .default))
            .foregroundStyle(.white)
    }
    
}
