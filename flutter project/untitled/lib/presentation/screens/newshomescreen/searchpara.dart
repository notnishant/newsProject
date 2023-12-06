// import 'package:flutter/material.dart';

// class SearchPara extends StatelessWidget {
//   final void Function(String) onSearchChanged;
//   final void Function(String?) onCountryChanged;

//   const SearchPara({
//     Key? key,
//     required this.onSearchChanged,
//     required this.onCountryChanged,
//   }) : super(key: key);

// // 

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     String selectedCountryCode = 'us'; // Default country is the United States

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedB
//           width: MediaQuery.of(context).size.width / 2.5,
//           child: TextField(
//             controller: searchController,
//             decoration: InputDecoration(
//               hintText: 'Search',
//               prefixIcon: const Icon(Icons.search_outlined),
//               hintStyle: TextStyle(
//                 color: Colors.grey.withOpacity(0.3),
//                 fontSize: 20,
//               ),
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             onChanged: onSearchChanged,
//           ),
//         ),
//         Container(
//           width: 2,
//           height: 30,
//           color: Colors.grey.withOpacity(0.3),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2.5,
//           child: DropdownButton<String>(
//             value: selectedCountryCode,
//             onChanged: (value) {
//               selectedCountryCode = value!;
//               onCountryChanged(value);
//             },
//             items: const [
//               DropdownMenuItem(
//                 value: 'us',
//                 child: Text('United States'),
//               ),
//               DropdownMenuItem(
//                 value: 'UK',
//                 child: Text('United Kingdom'),
//               ),
//               DropdownMenuItem(
//                 value: 'india',
//                 child: Text('India'),
//               ),
//               // Add more countries as needed
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
