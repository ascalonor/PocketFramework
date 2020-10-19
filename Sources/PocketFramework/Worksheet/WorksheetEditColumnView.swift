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
        
        public init(debit:Binding<Decimal>, credit:Binding<Decimal>) {
            self._debitEntry = debit
            self._creditEntry = credit
            
            self.decimalFormatter = NumberFormatter()
            decimalFormatter.alwaysShowsDecimalSeparator = false
            decimalFormatter.numberStyle = .decimal
            decimalFormatter.maximumFractionDigits = 2
        }
        
        public var body: some View {
            Form {
                Section(header: Text("Edit Adjustments")){
                    VStack(alignment: .leading) {
                        Text("Debit")
                        TextField("Enter Debit",value:$debitEntry, formatter:decimalFormatter)
                            .keyboardType(.decimalPad)
                            .onChange(of: debitEntry, perform: { value in
                                print("Debit Value: \(value)")
                                
                                self.debitEntry = NSDecimalNumber(decimal: value) as Decimal
                            })
                    }
                    VStack(alignment:.leading) {
                        Text("Credit")
                        TextField("Enter Credit", value:$creditEntry, formatter:decimalFormatter)
                            .keyboardType(.decimalPad)
                            .onChange(of: creditEntry, perform: { value in
                                print("Credit Value: \(value)")
                                self.creditEntry = NSDecimalNumber(decimal: value) as Decimal
                            })
                    }
                }
                Section {
                    HStack {
                        Button(action: {
                            print($debitEntry.wrappedValue)
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
    }
}

struct WorksheetEditColumnView_Previews: PreviewProvider {
    @State static var demoDebit:Decimal = 1000.00
    @State static var demoCredit:Decimal = 500.00
    
    static var previews: some View {
        PocketFramework.WorksheetEditColumnView(debit: $demoDebit, credit: $demoCredit)
    }
}
