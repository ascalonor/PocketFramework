//
//  TrialBalanceTotalsRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/16/20.
//

import SwiftUI

extension PocketFramework {
    public struct TrialBalanceTotalsRowView: View {
        @State var debit:Decimal
        @State var credit:Decimal
        
        public init(debit:Decimal, credit:Decimal) {
            self._debit = State(initialValue: debit)
            self._credit = State(initialValue: credit)
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
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: debit))
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: credit))
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

struct TrialBalanceTotalsRowView_Previews: PreviewProvider {
    static var previews: some View {
        PocketFramework.TrialBalanceTotalsRowView(debit:1000, credit: 2000)
    }
}
