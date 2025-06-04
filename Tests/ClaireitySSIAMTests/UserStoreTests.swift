import XCTest

@testable import Claireity_SSIAM

final class UserStoreTests: XCTestCase {
  func testRegisterAndLogin() throws {
    let fileURL = URL(fileURLWithPath: "/tmp/test-users.json")
    // Clean up file if it exists
    try? FileManager.default.removeItem(at: fileURL)

    let store = UserStore(fileURL: fileURL)
    XCTAssertNoThrow(try store.register(username: "alice", password: "secret"))
    XCTAssertTrue(store.login(username: "alice", password: "secret"))
    XCTAssertFalse(store.login(username: "alice", password: "wrong"))
  }
}
