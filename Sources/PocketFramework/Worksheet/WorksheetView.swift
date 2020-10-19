//
//  WorksheetView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/15/20.
//

import Foundation
import SwiftUI

extension PocketFramework {
    
    public struct WorksheetView : View {
        
        private var worksheetHeaderColumns = [
            GridItem()
        ]
        private var worksheetColumns = [
            GridItem(.fixed(400))
        ]
        
        private var workSheetRowColumnsRow1 = [
            GridItem(.fixed(10),alignment: .leading),
            GridItem(.flexible(minimum: 200), alignment: .leading),
            GridItem(.fixed(225), alignment: .center),
            GridItem(.fixed(228)),
            GridItem(.fixed(228)),
            GridItem(.fixed(228)),
            GridItem(.fixed(228)),
            GridItem(.fixed(12),alignment: .leading)
        ]

        private var workSheetRowColumnsRow2 = [
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
        
        @State var trialBalanceData: [TrialBalanceDataRow]
        @State private var totalDebit:Decimal
        @State private var totalCredit:Decimal
        
        public init(data:[TrialBalanceDataRow]) {
            self._trialBalanceData  = State(initialValue: data)
            
            var tempDebit:Decimal = 0.0
            var tempCredit:Decimal = 0.0
            
            for row in self._trialBalanceData.wrappedValue {
                tempDebit += row.TrialBalanceDebit
                tempCredit += row.TrialBalanceCredit
            }
            
            self._totalDebit = State(initialValue: tempDebit)
            self._totalCredit = State(initialValue: tempCredit)
        }
        
        public var body: some View {

            VStack(spacing: 0) {
                LazyVGrid(columns: worksheetHeaderColumns) {
                    Text("ROB SINCLAIR's HIGHLIGHT GRAPHIC SERVICES")
                    Text("WORKSHEET")
                    Text("FOR MONTH ENDING MAY 31, 202X")
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                }
                ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                    VStack  {
                        LazyVGrid(columns:workSheetRowColumnsRow1) {
                            PocketFramework.ColumnSpacer()
                            PocketFramework.HeaderTextCellView(text:"       ")
                            PocketFramework.HeaderTextCellView(text:"Trial Balance")
                            PocketFramework.HeaderTextCellView(text:"Adjustments")
                            PocketFramework.HeaderTextCellView(text:"Adjusted Trial Balance")
                            PocketFramework.HeaderTextCellView(text:"Income Statement")
                            PocketFramework.HeaderTextCellView(text:"Balance Sheet")
                            PocketFramework.ColumnSpacer()
                        }
                        Divider()
                        LazyVGrid(columns:workSheetRowColumnsRow2) {
                            Group {
                                PocketFramework.ColumnSpacer()
                                PocketFramework.HeaderTextCellView(text:"Account Titles")
                                PocketFramework.HeaderTextCellView(text:"Dr.")
                                PocketFramework.HeaderTextCellView(text:"Cr.")
                            }
                            Group {
                                PocketFramework.HeaderTextCellView(text:"Dr.")
                                PocketFramework.HeaderTextCellView(text:"Cr.")
                                PocketFramework.HeaderTextCellView(text:"Dr.")
                                PocketFramework.HeaderTextCellView(text:"Cr.")
                            }
                            Group {
                                PocketFramework.HeaderTextCellView(text:"Dr.")
                                PocketFramework.HeaderTextCellView(text:"Cr.")
                                PocketFramework.HeaderTextCellView(text:"Dr.")
                                PocketFramework.HeaderTextCellView(text:"Cr.")
                            }
                            PocketFramework.ColumnSpacer()
                        }
                        Divider()
                    }
                    VStack(spacing:3) {
                         ForEach(trialBalanceData, id: \.self) { row in
                                PocketFramework.WorksheetRowView(rowData: row)
                                Divider()
                                    .padding(.top, 4.0)
                         }
                        PocketFramework.TrialBalanceTotalsRowView(debit: $totalDebit, credit:$totalCredit)
                    }
                }
            }
        }
    }
}
    struct WorksheetView_Previews: PreviewProvider {
        static var previews: some View {
            var demoData:[PocketFramework.TrialBalanceDataRow] = []
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Cash", accountId: UUID(), trialBalanceDebit: 6155, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Accounts Receivable", accountId: UUID(), trialBalanceDebit: 5000, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Computer Supplies", accountId: UUID(), trialBalanceDebit: 600, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Prepaid Rent", accountId: UUID(), trialBalanceDebit: 1200, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Computer Equipment", accountId: UUID(), trialBalanceDebit: 6000, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Accounts Payable", accountId: UUID(), trialBalanceDebit: 0, trialBalanceCredit: 3350))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Rob Sinclair, Capital", accountId: UUID(), trialBalanceDebit: 0, trialBalanceCredit: 10000))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Rob Sinclair, Withdrawals", accountId: UUID(), trialBalanceDebit: 625, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Graphic Design Fees", accountId: UUID(), trialBalanceDebit: 0, trialBalanceCredit: 8000))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Office Salary Expense", accountId: UUID(), trialBalanceDebit: 1300, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Advertising Expense", accountId: UUID(), trialBalanceDebit: 250, trialBalanceCredit: 0))
            demoData.append(PocketFramework.TrialBalanceDataRow(name: "Telephone Expense", accountId: UUID(), trialBalanceDebit: 220, trialBalanceCredit: 0))
            return PocketFramework.WorksheetView(data: demoData)
        }
    }

