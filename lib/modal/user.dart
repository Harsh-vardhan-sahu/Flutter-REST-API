import 'package:api/modal/user_dob.dart';
import 'package:api/modal/user_location.dart';
import 'package:api/modal/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final Userdob dob;
  final Userlocation location;
   User({
    required this.gender,
     required this.email,
     required this.phone,
     required this.cell,
     required this.nat,
     required this.name,
     required this.dob,
     required this.location,
});
   String get fullName{
     return'${name.title} ${name.first} ${name.last}';
   }
}

