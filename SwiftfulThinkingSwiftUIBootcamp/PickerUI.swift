//
//  PickerUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/3/25.
//

import SwiftUI

struct PickerUI: View {
    
    @State var selectedItem: String = "most popular"
    @State var filterOption: [String] = ["most popular", "most popular", "most recent", "highest rated"]
    
    var body: some View {
        
        
        Picker(selection: $selectedItem,
               content: {
            ForEach(filterOption, id: \.self) { item in
                Text(item)
                    .tag(item)
            }
        },
               label: {
            Text("hello")
                .foregroundStyle(.red)
        })
        .pickerStyle(MenuPickerStyle())

        }
        
        
        
//        VStack {
//            
//            HStack{
//                Text("Age:")
//                Text(selectedItem)
//
//                
//            }
//            
//            Picker(
//                selection: $selectedItem,
//                content: {
//                    ForEach(18..<100, content: { number in
//                        Text("\(number)")
//                            .tag("\(number)")
//                    })
//                }, label: {
//                    Text("Picker")
//                })
//            .pickerStyle(WheelPickerStyle())
//        }
    }


#Preview {
    PickerUI()
}
