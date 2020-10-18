//
//  TrialBalanceTotalsRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/16/20.
//

import SwiftUI

extension PocketFramework {
    public struct TrialBalanceTotalsRowView: View {
        @Binding var debit:Decimal
        @Binding var credit:Decimal
        
        public init(debit:Binding<Decimal>, credit:Binding<Decimal>) {
            //self._debit = State(initialValue: debit)
            //self._credit = State(initialValue: credit)
            self._debit = debit
            self._credit = credit
            print(debit)
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
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: $debit.wrappedValue))
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: $credit.wrappedValue))
            }
        }
        public func formatToCurrency(decValue:Decimal) -> String {
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
