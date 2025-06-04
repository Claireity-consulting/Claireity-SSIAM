import Foundation

public struct User: Codable, Equatable {
  public var username: String
  public var password: String
}

public final class UserStore {
  private let fileURL: URL
  private var users: [User] = []

  public init(fileURL: URL = URL(fileURLWithPath: "users.json")) {
    self.fileURL = fileURL
    load()
  }

  public enum StoreError: Error {
    case userExists
  }

  public func register(username: String, password: String) throws {
    if users.contains(where: { $0.username == username }) {
      throw StoreError.userExists
    }
    users.append(User(username: username, password: password))
    try save()
  }

  public func login(username: String, password: String) -> Bool {
    users.contains(where: { $0.username == username && $0.password == password })
  }

  public func listUsernames() -> [String] {
    users.map { $0.username }
  }

  private func load() {
    guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
    do {
      let data = try Data(contentsOf: fileURL)
      users = try JSONDecoder().decode([User].self, from: data)
    } catch {
      users = []
    }
  }

  private func save() throws {
    let data = try JSONEncoder().encode(users)
    try data.write(to: fileURL)
  }
}
