//
//  WorksheetRowView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/18/20.
//

import SwiftUI
import Combine

extension PocketFramework {
    public struct WorksheetRowView: View {
        @ObservedObject var rowData:TrialBalanceDataRow
        @State private var isAdjustmentsEdit = false

        
        public init(rowData:TrialBalanceDataRow) {
            self.rowData = rowData
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
                    }.sheet(isPresented: $isAdjustmentsEdit, onDismiss: { handleUpdate() }) {
                        PocketFramework.WorksheetEditColumnView(debit: $rowData.AdjustmentsDebit, credit: $rowData.AdjustmentsCredit)
                    }
                }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.isAdjustmentsEdit.toggle()
                })
        }
        public func formatToCurrency(decValue:Double) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.usesGroupingSeparator = true
            formatter.maximumFractionDigits = 2
            return formatter.string(from: decValue as NSNumber)!
        }
        
        public func handleUpdate() {
            //print("sheet closed")
            //print(rowData)
        }
    }
}

struct WorksheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        let demoRow = PocketFramework.TrialBalanceDataRow()
        demoRow.Name = "Cash"
        demoRow.TrialBalanceDebit = 6155
        demoRow.AdjustedTrialBalanceDebit = 50
        demoRow.AdjustmentsDebit = 100
        return PocketFramework.WorksheetRowView(rowData: demoRow)
    }
}
