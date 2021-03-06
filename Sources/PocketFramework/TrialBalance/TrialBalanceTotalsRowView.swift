//
//  TrialBalanceTotalsRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/16/20.
//

import SwiftUI

extension PocketFramework {
    public struct TrialBalanceTotalsRowView: View {
        @Binding public var totalDebit:Double
        @Binding public var totalCredit:Double
        
        public init(debit:Binding<Double>, credit:Binding<Double>) {
            //self._debit = State(initialValue: debit)
            //self._credit = State(initialValue: credit)
            self._totalDebit = debit
            self._totalCredit = credit
            print("debit \(totalDebit)")
            print("credit \(totalCredit)")
        }
        
        private var rowDefinition = [
            GridItem(.fixed(10),alignment: .leading),
            GridItem(.flexible(), alignment: .leading),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(10),alignment: .leading)
        ]
        
        public var body: some View {
            LazyVGrid(columns:rowDefinition)  {
                PocketFramework.ColumnSpacer()
                PocketFramework.TextCellView(text:"  Totals")
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: $totalDebit.wrappedValue))
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: $totalCredit.wrappedValue))
            }
        }
        public func formatToCurrency(decValue:Double) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.usesGroupingSeparator = true
            formatter.maximumFractionDigits = 2
            return formatter.string(from: decValue as NSNumber)!
        }
    }
}

//struct TrialBalanceTotalsRowView_Previews: PreviewProvider {
//    @State static var demoDebit = 1000
//    @State static var demoCredit = 2000
//    static var previews: some View {
//        PocketFramework.TrialBalanceTotalsRowView(debit:demoDebit, credit: demoCredit)
//    }
//}
