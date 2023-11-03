// Model
class User {
  String name;
  String email;

  User(this.name, this.email);
}

// class UserRepository {
//   Future<User> fetchUser() async {
//     // Logic to fetch user from API or local database
//
//     return User("", "");
//   }
// }

// Repository Pattern
class UserRepository {
  final ApiProvider _apiProvider;

  UserRepository(this._apiProvider);

  Future<User> fetchUser() async {
    return await _apiProvider.getUser();
  }
}

class ApiProvider {
  Future<User> getUser() async {
    // API call to get user data
    return User("", "")
  }
}

// Usage
var apiProvider = ApiProvider();
var userRepository = UserRepository(apiProvider);
var user = await userRepository.fetchUser();
