//
//  WorksheetEditColumnView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/18/20.
//

import SwiftUI

extension PocketFramework {
    
    public struct WorksheetEditColumnView: View {
        @Environment(\.presentationMode) var presentationMode
        
        @Binding var debitEntry:Double
        @Binding var creditEntry:Double
        private var decimalFormatter:NumberFormatter
        
        
        public init(debit:Binding<Double>, credit:Binding<Double>) {
            self._debitEntry = debit
            self._creditEntry = credit
            
            self.decimalFormatter = NumberFormatter()
            self.decimalFormatter.isLenient = true
            decimalFormatter.numberStyle = .decimal
            decimalFormatter.alwaysShowsDecimalSeparator = false
            //decimalFormatter.alwaysShowsDecimalSeparator = false
            //decimalFormatter.maximumFractionDigits = 2
        }
        
        public var body: some View {
            Form {
                Section(header: Text("Edit Adjustments")){
                    VStack(alignment: .leading) {
                        Text("Debit")
                        TextField("Enter Debit",value:$debitEntry, formatter:decimalFormatter)
                            .keyboardType(.decimalPad)
                    }
                    VStack(alignment:.leading) {
                        Text("Credit")
                        TextField("Enter Credit",value:$creditEntry, formatter:decimalFormatter)
                            .keyboardType(.decimalPad)
                    }
                }
                Section {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Save")
                        }
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Cancel")
                        }
                    }
                }
            }
            .onAppear() {
                
            }
        }
        public func formatToString(decValue:Double) -> String {
            let formatter = NumberFormatter()
            //formatter.numberStyle = .currency
            //formatter.usesGroupingSeparator = true
            //formatter.maximumFractionDigits = 2
            return formatter.string(from: decValue as NSNumber)!
        }
//        public func stringToDecimal(stringValue:String) -> Decimal {
//            let decValue = Double(string: stringValue)
//            if decValue == nil {
//                return 0
//            }
//            return decValue!
//        }
    }
}

struct WorksheetEditColumnView_Previews: PreviewProvider {
    @State static var demoDebit:Double = 1000.00
    @State static var demoCredit:Double = 1500.00
    
    static var previews: some View {
        PocketFramework.WorksheetEditColumnView(debit: $demoDebit, credit: $demoCredit)
    }
}
