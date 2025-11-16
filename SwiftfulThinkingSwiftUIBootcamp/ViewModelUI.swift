//
//  ViewModelUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/7/25.
//

import SwiftUI

//Custom Data Type
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading : Bool = false
    
    //added this to call function upon init
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "orange", count: 1)
        let fruit2 = FruitModel(name: "bananas", count: 2)
        let fruit3 = FruitModel(name: "pears", count: 3)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            //self to referecne that this is a property within the class itself...
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }


    }
    
    func deleteFruit(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
        // we pass in the parameter name
    }
}

struct ViewModelUI: View {
    
    // @StateObject -> Use this on Creation / INIT
    // @ObservedObject -> Use this for SubViews after first view
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView{
            List{
                
                if fruitViewModel.isLoading {
                    ProgressView()
                }
                
                ForEach(fruitViewModel.fruitArray) {fruit in
                    HStack{
                        Text("\(fruit.count)")
                            .foregroundStyle(.red)
                        Text("\(fruit.name)")
                            .font(.headline)
                            .bold()
                    }
                }
                //may want to review how we simplify to the syntax below
                .onDelete(perform: fruitViewModel.deleteFruit)
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("Fruits"))
            .navigationBarItems(trailing:
            
            NavigationLink(destination: RandomScreen(fruitViewM: fruitViewModel)) {
                Image(systemName: "arrow.right")
                    .foregroundColor(.blue)
            }
            )
        }
    }
}


struct RandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewM: FruitViewModel //do not init or set equal to FruitViewModel() - so when we call the second screen it will ask us - pass in the fruit ViewModel param/property
    
    var body: some View {
        ZStack{
            //BG Layer
            Color.green.ignoresSafeArea(edges: .all)

            //Content
            VStack{
                ForEach(fruitViewM.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ViewModelUI()
}
