import XCTest
import SwiftUI

@testable import PocketFramework

final class PocketFrameworkTests: XCTestCase {
    @State var text:String
    
    public init(text:String) {
        self.text = text
        super.init()
    }
    
    func testExample() {

        var body: some View {
            PocketFramework.MainTextField(placeholder:"Testing", text:$text)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
