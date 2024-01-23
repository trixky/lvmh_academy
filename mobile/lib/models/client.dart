class LVMHclient {
  const LVMHclient({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.email,
    this.phone,
  });

  final int id;
  final String firstname;
  final String lastname;
  final String? email;
  final String? phone;
}