// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_signin_flutter_web/main.dart';
//
// class ProfilePage extends StatefulWidget {
//   final GoogleSignInAccount user;
//
//   ProfilePage({required this.user});
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               widget.user.displayName.toString(),
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             Text(
//               widget.user.email.toString(),
//               style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//               color: Colors.blueAccent,
//               onPressed: SignOut,
//               child: Text('Sign Out'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future SignOut() async {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
//   }
// }
