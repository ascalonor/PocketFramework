import SwiftUI

public struct PocketFramework {
    
    public struct TrialBalanceDataRow : Hashable {
        public var Name:String
        public var AccountId:UUID
        public var TrialBalanceDebit:Double
        public var TrialBalanceCredit:Double
        public var AdjustmentsDebit:Double
        public var AdjustmentsCredit:Double
        public var AdjustedTrialBalanceDebit:Double
        public var AdjustedTrialBalanceCredit:Double
        public var IncomeStatementDebit:Double
        public var IncomeStatementCredit:Double
        public var BalanceSheetDebit:Double
        public var BalanceSheetCredit:Double
        
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
        
        public init(name:String, accountId:UUID, trialBalanceDebit:Double, trialBalanceCredit:Double) {
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
