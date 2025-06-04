import Foundation

let store = UserStore()

func usage() {
  print("Usage: \(CommandLine.arguments[0]) <command> [options]")
  print("Commands:")
  print("  greet")
  print("  register <username> <password>")
  print("  login <username> <password>")
  print("  list")
}

if CommandLine.arguments.count < 2 {
  usage()
  exit(0)
}

switch CommandLine.arguments[1] {
case "greet":
  print(greet())
case "register":
  guard CommandLine.arguments.count >= 4 else {
    usage()
    exit(1)
  }
  do {
    try store.register(username: CommandLine.arguments[2], password: CommandLine.arguments[3])
    print("User registered.")
  } catch UserStore.StoreError.userExists {
    print("User already exists.")
  } catch {
    print("Registration failed: \(error)")
  }
case "login":
  guard CommandLine.arguments.count >= 4 else {
    usage()
    exit(1)
  }
  if store.login(username: CommandLine.arguments[2], password: CommandLine.arguments[3]) {
    print("Login successful.")
  } else {
    print("Invalid credentials.")
  }
case "list":
  for name in store.listUsernames() {
    print(name)
  }
default:
  usage()
}
=======
print(greet())
codex/generate-development-plan-based-on-repo-description
