//
//  data.swift
//  MidtermProject
//
//  Created by Jordyn Fulbright on 3/17/22.
//

import Foundation


var earl = "https://opentdb.com/api.php?amount=27&category=27&type=multiple"

class WeatherModel: ObservableObject {
    @Published var diff = String()
    @Published var question = String()
    @Published var answer = String()
    @Published var choices = [String]()

    
    init () {
        fetchWeather()
    }
    func fetchWeather() {
        guard let url = URL(string: earl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(DataLayout.self, from: data)
             
                DispatchQueue.main.async {
                    for i in 0...model.results.count-1{
                        
                    self.diff = model.results[i].difficulty
                    self.question = model.results[i].question
                    self.answer = model.results[i].answer
                    self.choices = model.results[i].choices
                        
                    }
                    
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}





struct DataLayout: Codable {
    let responseCode: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let category, type, difficulty, question: String
    let answer: String
    let choices: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case answer = "correct_answer"
        case choices = "incorrect_answers"
    }
}
