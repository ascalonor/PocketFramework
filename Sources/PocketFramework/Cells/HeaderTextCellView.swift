//
//  HeaderTextCellView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/18/20.
//

import SwiftUI

extension PocketFramework {
    struct HeaderTextCellView: View {
        var text:String
                
        public var body: some View {
            GeometryReader { reader in
                HStack( spacing:3) {
                    Spacer()
                    Text(self.text) .font(.body)
                    Spacer()
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                }
            }
        }
    }
}
struct HeaderTextCellView_Previews: PreviewProvider {
    static var text:String = "Sample Data"

    static var previews: some View {
        PocketFramework.HeaderTextCellView(text:text).frame(minHeight:50, maxHeight: 50)
    }
}
