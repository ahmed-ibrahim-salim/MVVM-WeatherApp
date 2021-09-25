//
//  ContentView.swift
//  MVVM-WeatherApp
//
//  Created by ahmadmedo on 7/24/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    @State private var index:Int = 0
//    var increase: () -> Void
    var body: some View {
            ZStack{
                BackgroundView()
                VStack{
                    Text(viewModel.cityName).font(.system(size: 44, weight: .medium)).foregroundColor(.white).multilineTextAlignment(.center)
                    Text(viewModel.countryName).font(.system(size: 28, weight: .medium)).foregroundColor(.white).multilineTextAlignment(.center)
                    VStack(spacing: 1){
                        Image(systemName: "cloud.sun.fill").renderingMode(.original).resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 130)
                        Text(viewModel.temp).font(.system(size: 70, weight: .medium))
                            .foregroundColor(.white)
                    }
                Text(viewModel.condition).font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white)
                HStack{
                    SmallWeatherTemplate(imageName: "cloud.sun.fill", temprature: "\(22.6)°",day: "SUN")
                    SmallWeatherTemplate(imageName: "sun.max.fill", temprature: "\(14.9)°",day: "MON")
                    SmallWeatherTemplate(imageName: "wind.snow", temprature: "\(25.6)°",day: "TUE")
                    SmallWeatherTemplate(imageName: "moon.stars.fill", temprature: "\(22.4)°",day: "WED")
                    SmallWeatherTemplate(imageName: "cloud.sun.rain.fill", temprature: "\(17.3)°",day: "THU")
                }.padding(.bottom)
                    Button{
                        self.index += 1
                        if (self.index > 9) {
                            self.index = 0
                        }
                        viewModel.nextCity(i: index)
                    } label:{
                        TextButtonTemplate(title: "Next City", textColor: .blue, backgroundColor: .white)
                    }
                Spacer()
                }
        }
    }
}

struct BackgroundView: View{
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct SmallWeatherTemplate: View {
    let imageName: String
    let temprature: String
    let day: String
    
    var body: some View{
        VStack{
            Text(day).font(.system(size: 20, weight: .medium, design: .default)).foregroundColor(.white).padding(.top)
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            Text(temprature).font(.system(size: 24, weight: .medium, design: .default)).foregroundColor(.white)
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
