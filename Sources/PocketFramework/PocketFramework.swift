import SwiftUI

public struct PocketFramework {
    
    public struct TrialBalanceDataRow : Hashable {
        public var Name:String
        public var AccountId:UUID
        public var TrialBalanceDebit:Decimal
        public var TrialBalanceCredit:Decimal
        public var AdjustmentsDebit:Decimal
        public var AdjustmentsCredit:Decimal
        public var AdjustedTrialBalanceDebit:Decimal
        public var AdjustedTrialBalanceCredit:Decimal
        public var IncomeStatementDebit:Decimal
        public var IncomeStatementCredit:Decimal
        public var BalanceSheetDebit:Decimal
        public var BalanceSheetCredit:Decimal
        
        public init() {
            Name = ""
            AccountId = UUID()
            TrialBalanceDebit = 0.0
            TrialBalanceCredit = 0.0
            AdjustmentsDebit = 0.0
            AdjustmentsCredit = 0.0
            AdjustedTrialBalanceDebit = 0.0
            AdjustedTrialBalanceCredit = 0.0
            IncomeStatementDebit = 0.0
            IncomeStatementCredit = 0.0
            BalanceSheetDebit = 0.0
            BalanceSheetCredit = 0.0
        }
        
        public init(name:String, accountId:UUID, trialBalanceDebit:Decimal, trialBalanceCredit:Decimal) {
            self.init()
            Name = name
            AccountId = accountId
            TrialBalanceDebit = trialBalanceDebit
            TrialBalanceCredit = trialBalanceCredit
        }
        
        public static func == (lbr:TrialBalanceDataRow, rbr:TrialBalanceDataRow) -> Bool {
            return lbr.AccountId.uuidString == rbr.AccountId.uuidString
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(AccountId.uuidString)
            hasher.combine(Name)
        }
    }
}
