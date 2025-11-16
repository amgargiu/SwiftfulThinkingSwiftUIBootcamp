//
//  ModelUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/7/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName : String
    let username : String
    let followersCount : Int
    let isVerified: Bool
}


struct ModelUI: View {
    
    @State var users : [UserModel] = [
//        "Antonio","Maria","Luca","Sara","Stefano"
        UserModel(displayName: "Antonio Gargiulo", username: "antoniogargiulo", followersCount: 123456, isVerified: true),
        UserModel(displayName: "Maria Rossi", username: "maria_rossi", followersCount: 789012, isVerified: false),
        UserModel(displayName: "Luca Bianchi", username: "luca_bianchi", followersCount: 456123, isVerified: false),
        UserModel(displayName: "Chris", username: "Christhedog", followersCount: 55555, isVerified: true)
    ]
    
    
    var body: some View {
        NavigationView{
            List {
                // need to make user strcut identifiable
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 32, height: 32)
                        VStack (alignment: .leading){
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.username)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        //verified indicator
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        }
                        
                        
                        VStack {
                            Text("\(user.followersCount)")
                                .font(.headline)
                            Text("followers")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }

            }
            .navigationTitle("Users")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

#Preview {
    ModelUI()
}
