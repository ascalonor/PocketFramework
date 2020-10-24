//
//  TextCellView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/15/20.
//

import SwiftUI

extension PocketFramework {
    public struct TextCellView: View {
        var text:String
                
        public init(text:String) {
            self.text = text
        }
        
        public var body: some View {
            GeometryReader { reader in
                HStack( spacing:3) {
                    Text(text) .font(.body)
                    Spacer()
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)

                }
            }
        }
    }
}

struct TextCellView_Previews: PreviewProvider {
    static var demoText:String = "Sample Data"
    
    static var previews: some View {
        return PocketFramework.TextCellView(text:demoText).frame(minHeight:50, maxHeight: 50)
    }
}
