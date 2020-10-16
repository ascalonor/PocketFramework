//
//  ColumnSpacer.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/15/20.
//

import Foundation
import SwiftUI

extension PocketFramework {
    public struct ColumnSpacer:View {
        
        public var body: some View {
            GeometryReader { reader in
                HStack(spacing:3) {
                    Spacer()
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                    Rectangle().frame( minWidth:1, maxWidth: 1, minHeight: reader.size.height + 10)
                }
            }
        }
    }
}

struct ColumnSpacer_Previews: PreviewProvider {
    static var previews: some View {
        PocketFramework.ColumnSpacer().frame(minHeight:50, maxHeight: 50)
    }
}
