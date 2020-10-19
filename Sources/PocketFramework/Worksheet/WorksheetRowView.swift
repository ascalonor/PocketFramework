//
//  WorksheetRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/18/20.
//

import SwiftUI

extension PocketFramework {
    public struct WorksheetRowView: View {
        @State var rowData:TrialBalanceDataRow
        @State private var isAdjustmentsEdit = false

        
        public init(rowData:TrialBalanceDataRow) {
            self._rowData = State(initialValue: rowData)
        }
        
        private var rowDefinition = [
            GridItem(.fixed(10),alignment: .leading),
            GridItem(.flexible(minimum: 200), alignment: .leading),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(110), alignment: .trailing),
            GridItem(.fixed(10),alignment: .leading)
        ]
        
        public var body: some View {
                LazyVGrid(columns:rowDefinition)  {
                    Group {
                        PocketFramework.ColumnSpacer()
                        PocketFramework.TextCellView(text:rowData.Name)
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.TrialBalanceDebit))
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.TrialBalanceCredit))
                    }
                    Group {
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.AdjustmentsDebit))
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.AdjustmentsCredit))
                    }
                    Group {
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.AdjustedTrialBalanceDebit))
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.AdjustedTrialBalanceCredit))
                    }
                    Group {
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.IncomeStatementDebit))
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.IncomeStatementCredit))
                    }
                    Group {
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.BalanceSheetDebit))
                        PocketFramework.NumericCellView(text:formatToCurrency(decValue: rowData.BalanceSheetCredit))
                    }.sheet(isPresented: $isAdjustmentsEdit) {
                        PocketFramework.WorksheetEditColumnView(debit: $rowData.AdjustedTrialBalanceDebit, credit: $rowData.AdjustedTrialBalanceCredit)
                    }
                }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.isAdjustmentsEdit.toggle()
                })
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

struct WorksheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        var demoRow = PocketFramework.TrialBalanceDataRow()
        demoRow.Name = "Cash"
        demoRow.TrialBalanceDebit = 6155
        demoRow.AdjustedTrialBalanceDebit = 50
        return PocketFramework.WorksheetRowView(rowData: demoRow)
    }
}