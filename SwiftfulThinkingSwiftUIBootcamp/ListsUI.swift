//
//  ListsUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 9/30/25.
//

import SwiftUI

struct ListsUI: View {
    
    @State var fruits : [String] = [
        "Apple", "Banana", "Orange", "Pineapple"
    ]
    @State var vegetables : [String] = [
        "Carrot", "Broccoli", "Spinach", "Beet"
    ]
    
    @State var isExpanded: Bool = true

    
    var body: some View {
        
        
 
        NavigationView {
            List{
                Section(isExpanded: $isExpanded) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: deleteFruit)
                    .onMove(perform: moveFruit)

                } header: {
                    Text("Fruits")
                        .bold()
                        .foregroundColor(.red)
                }
                
                Section(header: HStack {
                    Text("Vegetables")
                        .bold()
                        .foregroundStyle(.red)
                        .font(.headline)
                    Image(systemName: "flame")
                }){
                    ForEach(vegetables, id: \.self) { vegetable in
                        Text(vegetable)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.yellow)
                    }
                    .listRowBackground(Color.red)
                    
                }
                
                
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(),
                                trailing: addButton)
        }
        .accentColor(.red)

        
    }
    
    
    var addButton : some View {
        Button("Add") {
            addItem()
            }
    }
    
    func deleteFruit(indexSet : IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func moveFruit(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem() {
        fruits.append("Coconut")
    }
    
    
}

#Preview {
    ListsUI()
}
