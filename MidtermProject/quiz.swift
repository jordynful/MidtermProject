//
//  quiz.swift
//  MidtermProject
//
//  Created by Jordyn Fulbright on 3/16/22.
//

import SwiftUI



//refer to quiz variables as quiz.
struct quiz: View {
    @Binding var curr: Int
    var quizzy: DataLayout
    
    var body: some View {
        let quiz = quizzy.results
        var score = 0;
        var questions = 0;
        var aChoice:[String] = randomize(arr: quiz[curr].choices, answer: quiz[curr].answer);
        
        //Make incorrect overlay
        
        if (questions < 3) {
            VStack (spacing: 20){
                
                VStack(spacing: 126.0) {
                    HStack {
                       
                       Text("Difficulty: \(quiz[curr].difficulty)")
                            .padding()
                            .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                            .cornerRadius(10)
                        Spacer()
                            
                            
                        Text("Score:  \(score)/3")
                            .padding()
                            .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                            .cornerRadius(10)
                        
                    }
                    .padding()
                    
                    Text("\(quiz[curr].question)")
                        .padding()
                        .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                        .cornerRadius(10)
                    //question
                    //difficulty
                    //score so far
                }//1
                
            
                
                VStack {
                    //answer choices
                    Button(action: {
                        questions+=1
                        
                        if (isCorrect(answerChoice: aChoice[0], correct: quiz[curr].answer) == true) {
                            score += 1
                        }
                        if(questions < 3) {
                            curr+=1;
                            aChoice = randomize(arr:quiz[curr].choices, answer: quiz[curr].answer);
                        }
                    }) {
                        Text("\(aChoice[0])")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        questions+=1
                       
                        if (isCorrect(answerChoice: aChoice[1], correct: quiz[curr].answer) == true) {
                            score += 1
                        }//if
                        if(questions < 3) {
                            curr+=1;
                            aChoice = randomize(arr:quiz[curr].choices, answer: quiz[curr].answer);
                        }
                        //if not at 3 questions
                        //so next question
                        //and then
                        //randomize(arr: quiz.choices, answer: quiz.answer)
                        //add changes here
                        
                    }) {
                        Text("\(aChoice[1])")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        questions+=1
                        if (isCorrect(answerChoice: aChoice[2], correct: quiz[curr].answer) == true) {
                            score += 1
                        }
                        if(questions < 3) {
                            curr+=1;
                            aChoice = randomize(arr:quiz[curr].choices, answer: quiz[curr].answer);
                        }
                    }) {
                        Text("\(aChoice[2])")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        questions+=1
                        if (isCorrect(answerChoice: aChoice[3], correct: quiz[curr].answer) == true) {
                            score += 1
                        }
                        if(questions < 3) {
                            curr+=1;
                            aChoice = randomize(arr:quiz[curr].choices, answer: quiz[curr].answer);
                        }
                    }) {
                        Text("\(aChoice[3])")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                }//2
                .padding()
                .background(Color.init(UIColor(red: 0.703125, green: 0.8861727118, blue: 0.7683551908, alpha: 1)))
                .cornerRadius(10)
            }//main vstack
            .padding()
        }//if
        else {
            //also create array that holds date and score
            VStack {
                Text("Score")
                    .font(.largeTitle)
            }
            NavigationView {
                NavigationLink(destination: ContentView()) {
                    Text("Back to home")
                }
            }
            
        }//else
        
    }
}

//struct quiz_Previews: PreviewProvider {
//    static var previews: some View {
//        quiz(curr:0, quiz:)
//    }
//}
func isCorrect(answerChoice: String, correct: String) -> Bool {
    var right = false
    if (answerChoice == correct) {
        right = true
        return right
    }
    else {
        return right
    }
    
}

func randomize(arr: [String], answer:String) -> [String] {
    var aChoice:[String] = [" ", " ", " ", " "];
    let n = Int.random(in: 1...4)
    if (n == 1) {
        
        aChoice[0] = answer
        aChoice[1] = arr[0]
        aChoice[2] = arr[1]
        aChoice[3] = arr[2]
        
    }
    else if (n == 2) {
        aChoice[0] = arr[0]
        aChoice[1] = answer
        aChoice[2] = arr[1]
        aChoice[3] = arr[2]
    }
    else if(n == 3) {
        aChoice[0] = arr[1]
        aChoice[1] = arr[0]
        aChoice[2] = answer
        aChoice[3] = arr[2]
    }
    else {
        aChoice[0] = arr[1]
        aChoice[1] = arr[0]
        aChoice[2] = arr[2]
        aChoice[3] = answer
    }
    return aChoice
}
