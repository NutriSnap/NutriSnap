// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SquareButton extends StatelessWidget {
//   final String iconPath;
//   const SquareButton({
//     Key? key,
//     required this.iconPath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.white.withOpacity(0.8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: IconButton(
//         onPressed: () {},
//         icon: SvgPicture.asset(
//           iconPath,
//           height: 48,
//           width: 48,
//           fit: BoxFit.scaleDown,
//         ),
//       ),
//     );
//   }
// }
