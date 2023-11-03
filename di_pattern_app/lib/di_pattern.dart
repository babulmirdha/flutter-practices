// Model
class User {
  String name;
  String email;

  User(this.name, this.email);
}

class UserRepository {
  Future<User> fetchUser() async {
    // Logic to fetch user from API
    return User("Babul", "bbabyll.corp@gmail.comm");
  }
}

class UserProfileViewModel {
  final UserRepository userRepository;

  UserProfileViewModel( this.userRepository);

  late User _user;

  User get user => _user;

  Future<void> fetchUser() async {
    _user = await userRepository.fetchUser();
  }
}

// Usage
var userRepository = UserRepository();
var userProfileViewModel = UserProfileViewModel(userRepository);
