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
        
        @Binding var debitEntry:Decimal
        @Binding var creditEntry:Decimal
        private var decimalFormatter:NumberFormatter
        
        @State private var debitText:String
        @State private var creditText:String
        public init(debit:Binding<Decimal>, credit:Binding<Decimal>) {
            self._debitEntry = debit
            self._creditEntry = credit
            
            self.decimalFormatter = NumberFormatter()
            decimalFormatter.numberStyle = .decimal
            decimalFormatter.alwaysShowsDecimalSeparator = false
            decimalFormatter.allowsFloats = false
            decimalFormatter.maximumFractionDigits = 2
            
            self._debitText = State(initialValue: decimalFormatter.string(from: debit.wrappedValue as NSNumber)!)
            self._creditText = State(initialValue: decimalFormatter.string(from: credit.wrappedValue as NSNumber)!)
        }
        
        public var body: some View {
            Form {
                Section(header: Text("Edit Adjustments")){
                    VStack(alignment: .leading) {
                        Text("Debit")
                        TextField("Enter Debit",value:$debitText, formatter:decimalFormatter)
                            .keyboardType(.decimalPad)
                    }
                    VStack(alignment:.leading) {
                        Text("Credit")
                        TextField("Enter Credit", text:$creditText)
                            .keyboardType(.decimalPad)
                    }
                }
                Section {
                    HStack {
                        Button(action: {
                            //self.debitEntry = stringToDecimal(stringValue: debitText)
                            self.creditEntry = stringToDecimal(stringValue: creditText)
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
        public func formatToString(decValue:Decimal) -> String {
            let formatter = NumberFormatter()
            //formatter.numberStyle = .currency
            //formatter.usesGroupingSeparator = true
            //formatter.maximumFractionDigits = 2
            return formatter.string(from: decValue as NSNumber)!
        }
        public func stringToDecimal(stringValue:String) -> Decimal {
            let decValue = Decimal(string: stringValue)
            if decValue == nil {
                return 0
            }
            return decValue!
        }
    }
}

struct WorksheetEditColumnView_Previews: PreviewProvider {
    @State static var demoDebit:Decimal = 1000.00
    @State static var demoCredit:Decimal = 500.00
    
    static var previews: some View {
        PocketFramework.WorksheetEditColumnView(debit: $demoDebit, credit: $demoCredit)
    }
}
