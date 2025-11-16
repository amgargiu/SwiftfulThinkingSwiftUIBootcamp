//
//  DatePickerUI.swift
//  SwiftfulThinkingSwiftUIBootcamp
//
//  Created by Antonio Gargiulo on 10/3/25.
//

import SwiftUI

struct DatePickerUI: View {
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        
        DatePicker("select a date", selection: $selectedDate, displayedComponents: .hourAndMinute)
            .font(.headline)
            .foregroundColor(.blue)
        
    }
}

#Preview {
    DatePickerUI()
}
