//
//  MonthPickerView.swift
//  HabitTracker
//
//  Created by Miriam Mendes on 25/06/24.
//

import SwiftUI

struct YearPickerView: View {
    @Binding var selectionYear: String
    var body: some View {
        HStack {
            Picker(
                selection: $selectionYear,
                label: Text("Select Year"),
            content: {
                ForEach(2000..<2200){number in
                    Text("\(String(number))").tag("\(number)")
                }
            })
            .pickerStyle(.wheel)

        }
    }
}

#Preview {
    YearPickerView(selectionYear: .constant("2020"))
}
