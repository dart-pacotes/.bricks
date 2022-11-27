class Credentials {
  final String username;

  final String password;

  const Credentials({
    required this.username,
    required this.password,
  });

  const Credentials.email({
    required String email,
    required String password,
  }) : this(username: email, password: password);
}
