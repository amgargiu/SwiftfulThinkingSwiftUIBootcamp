//
//  EnvironmentObjectUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/20/25.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["ipad", "iphone", "macbook", "Iwatch"])
    }
    
    
}



struct EnvironmentObjectUI: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: {
                        //detail view has a non-initilized slectedItem variable - we pass in the item here as that varibale when we call the view - this is how we pass info through app
                        DetailView(selectedItem: item)
                    }, label: {
                        Text(item)
                    })
                    
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
        //add the above so no longer need to call observable for this object in the environment
    }
}




struct DetailView: View {
    
    let selectedItem: String
    //@ObservedObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        
        ZStack{
            //BG Layer
            Color.orange.ignoresSafeArea(edges: .all)
            
            //content
            
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(.white)
                    .cornerRadius(30)
            }

            
        }
        
        
    }
}


struct FinalView: View {
    
    //@ObservedObject var viewModel: EnvironmentViewModel
    @EnvironmentObject var viewModel: EnvironmentViewModel

    
    var body: some View{
        
        ZStack{
            //BG
            
            LinearGradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            //
            ScrollView{
                VStack(spacing: 20){
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
            }
        }
    }
}



#Preview {
    EnvironmentObjectUI()
    //DetailView(selectedItem: "hhh")
    //FinalView()

}

