import SwiftUI

public struct PocketFramework {
    
    public class TrialBalanceDataRow : Hashable {
        public var Name:String
        public var AccountId:UUID
        @Published public var TrialBalanceDebit:Double
        @Published public var TrialBalanceCredit:Double
        @Published public var AdjustmentsDebit:Double
        @Published public var AdjustmentsCredit:Double
        @Published public var AdjustedTrialBalanceDebit:Double
        @Published public var AdjustedTrialBalanceCredit:Double
        @Published public var IncomeStatementDebit:Double
        @Published public var IncomeStatementCredit:Double
        @Published public var BalanceSheetDebit:Double
        @Published public var BalanceSheetCredit:Double
        
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
        
        public convenience init(name:String, accountId:UUID, trialBalanceDebit:Double, trialBalanceCredit:Double) {
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
