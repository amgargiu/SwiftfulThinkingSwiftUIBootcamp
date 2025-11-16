//
//  OboardingViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/23/25.
//

import SwiftUI

struct OboardingViewUI: View {
    
    /*
     0 - welcome
     1 - name
     2 - age
     3 - gender
     */
    
    
    // for onboarding stages
    @State var onboardingStage: Int = 0
    let transtion: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    // for alerts
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    
    // onboarding inputs
    @State var name : String = ""
    @State var age : Double = 50.0
    @State var gender : String = ""

    //app storage - making these optional because if we open the app and we didnt set stuff up yet these will all be nil
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    
    var body: some View {
        
        ZStack{
            
            //content
            ZStack{
                
                
               switch onboardingStage {
               case 0:
                   welcomeView
                       .transition(transtion)
               case 1:
                   inputName
                       .transition(transtion)
               case 2:
                   inputAge
                       .transition(transtion)
               case 3:
                   inputGender
                       .transition(transtion)
               default:
                   RoundedRectangle(cornerRadius: 6)
                }
                
                
            }
            
            //Buttons
            
            //the Vstack is on top of the whole ZStack - we add a spacer at top of Vstack to push everything to the button
            VStack{
                
                Spacer()
                bottomButton
            }
            .padding(30)
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("\(alertTitle)"), dismissButton: .default(Text("OK")))
        }
    
    }
    
}

#Preview {
    OboardingViewUI()
        .background(Color.yellow)
}



// MARK: COMPONENTS

extension OboardingViewUI {
    
    private var bottomButton: some View {
        Text(onboardingStage == 0 ? "Sign up" : onboardingStage == 3 ? "Finish" : "Next" )
            .font(.largeTitle)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
                handleNextButtonTapped()
            }
    }
    
    private var welcomeView: some View {
        VStack {
            Spacer()
            Image(systemName: "heart.text.clipboard.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 350)
                .foregroundColor(.white)
            
            Text("Find Your Match")
                .font(.largeTitle)
                .foregroundColor(.white)
                .overlay{
                    Capsule(style: .continuous)
                        .frame(height: 2)
                        .offset(y: 18)
                        .foregroundColor(.white)
                }
            
            Text("Swipe Right to Find Your Match, Swiple left if you dont like the person that you see")
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var inputName: some View {
        VStack (spacing: 20) {
            Spacer()
            Text("Input Name Below")
                .font(.largeTitle)
                .foregroundStyle(.white)
            TextField("name here", text: $name)
                .font(.headline)
                .frame(height: 40)
                .padding(.horizontal, 8)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var inputAge: some View {
        VStack (spacing: 20) {
            Spacer()
            Text("Input Age Below")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("your age is \(String(format: "%.0f", age))")
                .font(.headline)
                .fontWeight(.semibold)
            Slider(value: $age, in: 18...100,step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)

    }
    
    private var inputGender: some View {
        VStack (spacing: 20) {
            Spacer()
            Text("Input gender Below")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Picker(selection: $gender,
                   content: {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                        Text("None").tag("None")
            },
                   label: {
                        Text("Picker")
            })
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300)
            .background(Color.white)
            .cornerRadius(10)
            
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    
}


// MARK: FUNCTIONS

extension OboardingViewUI {
    
    func handleNextButtonTapped() {
        
        //CHECKING INPUTS - switch and do checks based on Onboarding Stage
        
        switch onboardingStage {
        case 1:
            guard name.count > 3 else {
                showAlert(title: "Too Short")
                return
            }
        case 2:
            break
        case 3:
            guard gender.count > 0 else {
                showAlert(title: "Select a Gender Option 😳")
                return
            }
        default:
            break
        }
        
        
        
        //GO TO NEXT SECTION
        if onboardingStage == 3 {
            signIn()
        } else{
            withAnimation(.spring()) {
                onboardingStage += 1
            }
        }
        
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()){
            currentUserSignedIn = true
        }
    }
    
    
    func showAlert(title: String) {
        alertTitle = title //set alertTitle var equal to title WE pass in
        showAlert.toggle()
    }
    
    
}
