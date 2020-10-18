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
        
        @State var trialBalanceData: [TrialBalanceDataRow]
        @State private var totalDebit:Decimal
        @State private var totalCredit:Decimal
        
        public init(data:[TrialBalanceDataRow]) {
            self._trialBalanceData  = State(initialValue: data)
            self._totalDebit = State(initialValue: 0.0)
            self._totalCredit = State(initialValue: 0.0)
        }
        
        public var body: some View {

            VStack(spacing: 0) {
                LazyVGrid(columns: worksheetHeaderColumns) {
                    Text("ROB SINCLAIR's HIGHLIGHT GRAPHIC SERVICES")
                    Text("TRIAL BALANCE")
                    Text("MAY 31, 202X")
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                }
                ScrollView {
                    VStack(spacing:3) {
                         ForEach(trialBalanceData, id: \.self) { row -> AnyView in

                            return AnyView (VStack(spacing:3) {
                                PocketFramework.TrialBalanceRowView(rowData: row)
                                Divider()
                                    .padding(.top, 4.0)
                            })
                         }
                        PocketFramework.TrialBalanceTotalsRowView(debit:totalDebit, credit:totalCredit)
                    }
                }
            }.onAppear() {
                for row in trialBalanceData {
                    self._totalDebit.wrappedValue += row.TrialBalanceDebit
                    self._totalCredit.wrappedValue += row.TrialBalanceCredit
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

