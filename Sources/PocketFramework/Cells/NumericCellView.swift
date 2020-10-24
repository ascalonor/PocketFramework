//
//  NumericCellView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/15/20.
//

import SwiftUI

extension PocketFramework {
    public struct NumericCellView: View {
        var text:String
        
        public init(text:String) {
            self.text = text
        }
        
        public init(numValue:Double) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.usesGroupingSeparator = true
            formatter.maximumFractionDigits = 2
            text = formatter.string(from: numValue as NSNumber)!
        }
        
        public var body: some View {
            GeometryReader { reader in
                HStack( spacing:3) {
                    Spacer()
                    Text(text)
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                }
            }
        }
    }
}

struct NumericCellView_Previews: PreviewProvider {
    static var text:String = "12345.67"
    
    static var previews: some View {
        PocketFramework.NumericCellView(text: text).frame(minHeight:50, maxHeight: 50)
    }
}
