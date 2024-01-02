// import 'package:flutter/material.dart';
// import 'package:tollhopper/global/theme/themes.dart';
//
// class CountrySelectOption extends StatefulWidget {
//   final CountryEnum? countryEnum;
//   final ValueChanged<CountryEnum?>? onChanged;
//   final Color? borderEnableColor;
//   const CountrySelectOption(
//       {Key? key,
//       required this.countryEnum,
//       required this.onChanged,
//       this.borderEnableColor})
//       : super(key: key);
//
//   @override
//   State<CountrySelectOption> createState() => _CountrySelectOptionState();
// }
//
// class _CountrySelectOptionState extends State<CountrySelectOption> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return SizedBox(
//       height: 50,
//       child: DropdownButtonFormField(
//         value: widget.countryEnum,
//         isExpanded: true,
//         onChanged: widget.onChanged,
//         menuMaxHeight: 300,
//         icon: Icon(
//           Icons.arrow_drop_down,
//           size: 25,
//           color: (widget.countryEnum != null)
//               ? geryTextLoginInputColor
//               : geryHintLoginInputColor,
//         ),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: globalBackgroundColor, // Set the desired background color
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: widget.borderEnableColor ??
//                   Colors.transparent, // Set the desired border color
//               width: 1.0, // Set the desired border width
//             ),
//             borderRadius: BorderRadius.circular(0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(0.0),
//             ),
//             borderSide: BorderSide(
//                 color: widget.borderEnableColor ?? Colors.transparent,
//                 width: 1), // Border color and width
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(0.0),
//             ),
//             borderSide: BorderSide(
//                 color: appPrimaryColor,
//                 width: 1), // Focus border color and width
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         ),
//         items: CountryEnum.values
//             .map<DropdownMenuItem<CountryEnum>>((CountryEnum country) {
//           return DropdownMenuItem<CountryEnum>(
//             value: country,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flag.fromCode(
//                   country.code,
//                   height: 13,
//                   width: 20,
//                 ),
//                 const SizedBox(width: 7),
//                 Text(
//                   country.title,
//                   style: theme.textTheme.headline3,
//                   textAlign: TextAlign.start,
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
