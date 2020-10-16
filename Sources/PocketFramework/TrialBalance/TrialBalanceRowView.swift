//
//  TrialBalanceRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/16/20.
//

import SwiftUI

extension PocketFramework {
    
    public struct TrialBalanceRowView: View {
        @State var rowData:TrialBalanceDataRow
        
        public init(rowData:TrialBalanceDataRow) {
            self._rowData = State(initialValue: rowData)
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
                PocketFramework.TextCellView(text:rowData.Name)
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.TrialBalanceDebit))
                PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.TrialBalanceCredit))
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

struct TrialBalanceRowView_Previews: PreviewProvider {
    static var previews: some View {
        var demoRow = PocketFramework.TrialBalanceDataRow()
        demoRow.Name = "Cash"
        demoRow.TrialBalanceDebit = 6155
        return PocketFramework.TrialBalanceRowView(rowData: demoRow)
    }
}
