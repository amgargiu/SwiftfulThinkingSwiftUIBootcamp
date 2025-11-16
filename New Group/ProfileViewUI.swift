//
//  ProfileViewUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/23/25.
//

import SwiftUI

struct ProfileViewUI: View {
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    
    var column: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(.white)
                .overlay(
                    
                    VStack {
                        HStack (alignment: .center){
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                            
                            VStack(alignment: .leading){
                                Text("\(currentUserName ?? "User")")
                                Text("\(currentUserAge ?? 0) years old")
                            }
                        }
                        
                        Text("your gender is : \(currentUserGender ?? "Gender")")
                        
                        Text("Sign Out")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.red.opacity(0.2))
                            .cornerRadius(10)
                            .onTapGesture {
                                signOut()
                            }
                    }
                    .font(.largeTitle)
                    
                    , alignment: .topLeading)
                .padding()
                
                
            ScrollView{
                    LazyVGrid(
                        columns: column,
                        alignment: .center,
                        spacing: 6,
                        pinnedViews: [],
                        content: {
                            ForEach(0..<50) { index in
                                Rectangle()
                                    .frame(height: 150)
                            }
                        })
            }
        }
        
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false

        }
    }
}

#Preview {
    ProfileViewUI()
}
