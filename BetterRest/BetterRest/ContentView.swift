//
//  ContentView.swift
//  BetterRest
//
//  Created by Atiqul Islam on 7/2/24.
//
import CoreML
import SwiftUI


struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    @State private var wakeUp = Date.now
    @State private var alertTitle=""
    @State private var alertMessage=""
    @State private var showingAlert=false
    
    func calculateBedTime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            //something went wrong
            alertTitle="Error"
            alertMessage="Something went wrong"
        
        }
        showingAlert = true
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Form {
                     Text("When do you want to wake up?")
                        .font(.headline)
                  
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    Text("Desire amount of sleep")
                       .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours ", value: $sleepAmount , in: 4...12, step: 0.25)
                    
                    Text("Daily coffe intake")
                       .font(.headline)
                    Stepper("\(coffeAmount) cups ", value: $coffeAmount , in: 1...20, step:1)
                }
              
            }
            .toolbar{
                Button("Done", action: calculateBedTime)
            }
            .navigationTitle("Better Rest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
