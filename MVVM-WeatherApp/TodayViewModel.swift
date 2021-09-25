//
//  ViewModel.swift
//  MVVM-WeatherApp
//
//  Created by ahmadmedo on 7/24/21.
//

import Foundation
// data needed by view


class WeatherViewModel: ObservableObject{
    @Published var cityName: String = ""
    @Published var countryName: String = ""
    @Published var temp: String = ""
    @Published var condition: String = ""
    
    init(){
        fetchWeather(city:"berlin")
    }
    let cities:[String] = ["dubai","cairo","paris","tokyo","delhi","mumbai","dhaka","osaka","karachi","istanbul"]
    func nextCity(i: Int){
        print("\(i)")
        fetchWeather(city:cities[i])
    }
    
    func fetchWeather(city:String) {
//
        guard let url = URL(string:"https://api.weatherapi.com/v1/current.json?key=e65eef6acf094258a1b121037212407&q=\(city)&aqi=no") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.sync {
                    self.temp = "\(model.current.temp_c)°"
                    self.condition = model.current.condition.text
                    self.cityName = "\(model.location.name)"
                    self.countryName = "\(model.location.country)"
                }
            } catch {
                print("Failed")
            }
        }
        
        task.resume()
    }
}
