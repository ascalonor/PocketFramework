//
//  DateCellView.swift
//  PocketFramework
//
//  Created by David Waddleton on 10/25/20.
//

import SwiftUI

public extension PocketFramework {
    struct DateCellView: View {
        var date: Date
        private var formattedDate: String

        public init(date: Date) {
            self.date = date
            self.formattedDate = dateFormatter.string(from: self.date)
        }

        public var body: some View {
            GeometryReader { reader in
                HStack(spacing: 3) {
                    Text(formattedDate).font(.body)
                    Spacer()
                    Rectangle().frame(minWidth: 1, maxWidth: 1, minHeight: reader.size.height + 10)
                    Rectangle().frame(minWidth: 1, maxWidth: 1, minHeight: reader.size.height + 10)
                }
            }
        }

        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            return formatter
        }()
    }
}

struct DateCellView_Previews: PreviewProvider {
    static var previews: some View {
        PocketFramework.DateCellView(date: Date())
    }
}
