//
//  ContentView.swift
//  MidtermProject
//
//  Created by Jordyn Fulbright on 3/16/22.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @ObservedObject var Info = WeatherModel()
    
    @State var curr = 0
    @State var isAtMaxScale = false
     
    var body: some View {
        
    
        NavigationView {
            VStack (spacing: 45){
            //title
                Text("Info.diff")
                    .font(.title)
                    .padding()
                .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                .cornerRadius(15)
            
                  
            
    
                    //play and view daily scores
                    
                    NavigationLink (destination: quiz(curr: self.$curr, quizzy: Info.Datalayout.results)){
                        //import quiz questions and increment place in quiz w curr
                        Text("Play Daily Quiz")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)

                            .cornerRadius(15)
                    }
                .frame(width: 250, height: 250)
                .padding()
                .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                .cornerRadius(15)
                
            }//vstack
//        .padding()
//        .frame(width: 300, height: 400)
//
//        .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
//        .cornerRadius(15)
//
            
        }//nav view
        
        
        
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



public class GetData: ObservableObject {
    @Published var quizzy = [DataLayout]()
    init() {
        load()
    }
    
    func load() {
        let dataUrl = URL(string: "https://opentdb.com/api.php?amount=27&category=27&type=multiple")!
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: dataUrl) {(data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try decoder.decode([DataLayout].self, from: d)
                    DispatchQueue.main.async {
                        self.quizzy = decodedLists
                    }//async
                }//if
                else {
                    print ("No Data")
                }//else
            }//do
            catch {
                print ("error")
            }//catch
        }//url session
        .resume()
    }//load function
    
}//get data class


