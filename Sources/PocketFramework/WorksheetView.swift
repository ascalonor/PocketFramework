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
        
        private var worksheetRowsDefinitions = [
            GridItem(.fixed(50),alignment: .leading),
            GridItem(.flexible(), alignment: .leading),
            GridItem(.fixed(100), alignment: .trailing),
            GridItem(.fixed(100), alignment: .trailing)
        ]
        
        //        @State var placeholder: String
        //        @Binding var text: String
        //
        //        public init(placeholder:String, text:Binding<String>) {
        //            self._placeholder = State(initialValue: placeholder)
        //            self._text = text
        //        }
        
        public var body: some View {
            VStack(spacing: 0) {
                LazyVGrid(columns: worksheetHeaderColumns){
                    Text("ROB SINCLAIR's HIGHLIGHT GRAPHIC SERVICES")
                    Text("TRIAL BALANCE")
                    Text("MAY 31, 202X")
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                    Rectangle().frame(height:1).foregroundColor(Color.black)
                }
                List {
                    ForEach((0...10), id: \.self) { index in
                        LazyVGrid(columns:worksheetRowsDefinitions) {
                            Text("S")
                            Text("Item \(index)")
                            Text("2000")
                            Text("3000")
                        }
                    }
                }
            }
        }
    }
}

struct WorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        PocketFramework.WorksheetView()
    }
}
