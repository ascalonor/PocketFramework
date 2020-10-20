import SwiftUI

public struct PocketFramework {
    
    public class TrialBalanceDataRow : ObservableObject, Hashable {
        public var Name:String
        public var AccountId:UUID
        public var AccountCategory:Int16
        public var NormalBalance:String
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
        @Published public var IsOnTrialBalance:Bool
        @Published public var IsOnIncomeStatement:Bool
        @Published public var IsOnBalanceSheet:Bool
        @Published public var IsAdjustment:Bool
        
        public init() {
            Name = ""
            AccountId = UUID()
            AccountCategory = 999
            NormalBalance = "D"
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
            IsOnTrialBalance = false
            IsAdjustment = false
            IsOnIncomeStatement = false
            IsOnBalanceSheet = false
        }
        
        public convenience init(name:String, accountId:UUID, trialBalanceDebit:Double, trialBalanceCredit:Double) {
            self.init()
            Name = name
            AccountId = accountId
            TrialBalanceDebit = trialBalanceDebit
            TrialBalanceCredit = trialBalanceCredit
            IsOnTrialBalance = true
        }
        
        public convenience init(name:String, accountId:UUID, adjustmentDebit:Double, adjustmentCredit:Double, onIncomeStatement:Bool, onBalanceSheet:Bool) {
            self.init()
            Name = name
            AccountId = accountId
            TrialBalanceDebit = adjustmentDebit
            TrialBalanceCredit = adjustmentCredit
            IsOnTrialBalance = false
            IsOnIncomeStatement = onIncomeStatement
            IsOnBalanceSheet = onBalanceSheet
            IsAdjustment = true
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
