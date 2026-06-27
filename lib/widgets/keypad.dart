// import 'package:flutter/material.dart';

// import '../constants/app_sizes.dart';

// class Keypad extends StatelessWidget {
//   final void Function(int) onDigit;
//   final VoidCallback onClear;

//   const Keypad({super.key, required this.onDigit, required this.onClear});

//   @override
//   Widget build(BuildContext context) {
//     final buttons = [1, 2, 3, 4, 5, 6, 7, 8, 9];

//     return Card(
//       elevation: AppSizes.cardElevation,
//       child: Padding(
//         padding: const EdgeInsets.all(AppSizes.padding),
//         child: Column(
//           children: [
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: AppSizes.spacing,
//                 mainAxisSpacing: AppSizes.spacing,
//                 childAspectRatio: 1.1,
//                 children: [
//                   ...buttons.map(_buildDigitButton),
//                   _buildClearButton(context),
//                   _buildDigitButton(0),
//                   const SizedBox.shrink(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDigitButton(int digit) {
//     return ElevatedButton(
//       onPressed: () => onDigit(digit),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSizes.buttonCornerRadius),
//         ),
//         minimumSize: const Size(AppSizes.buttonMinSize, AppSizes.buttonMinSize),
//       ),
//       child: Text(
//         digit.toString(),
//         style: const TextStyle(fontSize: AppSizes.buttonFontSize),
//       ),
//     );
//   }

//   Widget _buildClearButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onClear,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Theme.of(context).colorScheme.errorContainer,
//         foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSizes.buttonCornerRadius),
//         ),
//       ),
//       child: const Text(
//         'CLEAR',
//         style: TextStyle(fontSize: AppSizes.buttonFontSize),
//       ),
//     );
//   }
// }






//new version updated 

// import 'package:flutter/material.dart';
// import '../constants/app_sizes.dart';

// class Keypad extends StatelessWidget {
//   final void Function(int) onDigit;
//   final VoidCallback onClear;

//   const Keypad({super.key, required this.onDigit, required this.onClear});

//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     final isPortrait = orientation == Orientation.portrait;

//     return Padding(
//       padding: const EdgeInsets.all(AppSizes.spacing),
//       child: GridView.count(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         crossAxisCount: isPortrait ? 3 : 4,
//         crossAxisSpacing: AppSizes.spacing,
//         mainAxisSpacing: AppSizes.spacing,
//         childAspectRatio: isPortrait ? 1.2 : 1.5,
//         children: isPortrait ? _buildPortraitButtons(context) : _buildLandscapeButtons(context),
//       ),
//     );
//   }

//   List<Widget> _buildPortraitButtons(BuildContext context) {
//     return [
//       _buildDigitButton(1), _buildDigitButton(2), _buildDigitButton(3),
//       _buildDigitButton(4), _buildDigitButton(5), _buildDigitButton(6),
//       _buildDigitButton(7), _buildDigitButton(8), _buildDigitButton(9),
//       _buildDigitButton(0),
//       _buildClearButton(context, itemSpan: 2),
//     ];
//   }

//   List<Widget> _buildLandscapeButtons(BuildContext context) {
//     return [
//       _buildDigitButton(1), _buildDigitButton(2), _buildDigitButton(3), _buildDigitButton(4),
//       _buildDigitButton(5), _buildDigitButton(6), _buildDigitButton(7), _buildDigitButton(8),
//       _buildDigitButton(9), _buildDigitButton(0), _buildClearButton(context, itemSpan: 2),
//     ];
//   }

//   Widget _buildDigitButton(int digit) {
//     return ElevatedButton(
//       onPressed: () => onDigit(digit),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.grey[300],
//         foregroundColor: Colors.black,
//         elevation: 0,
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//       ),
//       child: Text(
//         digit.toString(),
//         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
//       ),
//     );
//   }

//   Widget _buildClearButton(BuildContext context, {required int itemSpan}) {
//     return GridTile(
//       child: ElevatedButton(
//         onPressed: onClear,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.grey[300],
//           foregroundColor: Colors.black,
//           elevation: 0,
//           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         ),
//         child: const Text(
//           'CLEAR',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//         ),
//       ),
//     );
//   }
// }








//2nd update 



// import 'package:flutter/material.dart';
// import '../constants/app_sizes.dart';

// class Keypad extends StatelessWidget {
//   final void Function(int) onDigit;
//   final VoidCallback onClear;

//   const Keypad({super.key, required this.onDigit, required this.onClear});

//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     final isPortrait = orientation == Orientation.portrait;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing),
//       child: isPortrait ? _buildPortraitLayout(context) : _buildLandscapeLayout(context),
//     );
//   }

//   // Portrait layout: 3 columns. CLEAR button sits on the right of 0 and takes up 2 column blocks.
//   Widget _buildPortraitLayout(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3')])),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(child: Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6')])),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(child: Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9')])),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(
//           child: Row(
//             children: [
//               _buildButton('0'),
//               const SizedBox(width: AppSizes.spacing),
//               Expanded(flex: 2, child: _buildClearButton(context)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // Landscape layout: 4 columns. Matches assignment view layout exactly!
//   Widget _buildLandscapeLayout(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('4')])),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(child: Row(children: [_buildButton('5'), _buildButton('6'), _buildButton('7'), _buildButton('8')])),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(
//           child: Row(
//             children: [
//               _buildButton('9'),
//               const SizedBox(width: AppSizes.spacing),
//               _buildButton('0'),
//               const SizedBox(width: AppSizes.spacing),
//               Expanded(flex: 2, child: _buildClearButton(context)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildButton(String text) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
//         child: SizedBox(
//           height: double.infinity,
//           child: ElevatedButton(
//             onPressed: () => onDigit(int.parse(text)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.grey[300],
//               foregroundColor: Colors.black,
//               elevation: 0,
//               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//               padding: EdgeInsets.zero,
//             ),
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildClearButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
//       child: SizedBox(
//         height: double.infinity,
//         child: ElevatedButton(
//           onPressed: onClear,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.grey[300],
//             foregroundColor: Colors.black,
//             elevation: 0,
//             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//             padding: EdgeInsets.zero,
//           ),
//           child: const Text(
//             'CLEAR',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//           ),
//         ),
//       ),
//     );
//   }
// }











//3rd update

import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';

class Keypad extends StatelessWidget {
  final void Function(int) onDigit;
  final VoidCallback onClear;

  const Keypad({super.key, required this.onDigit, required this.onClear});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
      child: isPortrait ? _buildPortraitLayout(context) : _buildLandscapeLayout(context),
    );
  }

  // Portrait layout: 3 columns. Using fixed row heights to prevent vertical stretching.
  // Widget _buildPortraitLayout(BuildContext context) {
  //   const double rowHeight = 60.0; // Control button height here
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       SizedBox(height: rowHeight, child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3')])),
  //       const SizedBox(height: AppSizes.spacing),
  //       SizedBox(height: rowHeight, child: Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6')])),
  //       const SizedBox(height: AppSizes.spacing),
  //       SizedBox(height: rowHeight, child: Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9')])),
  //       const SizedBox(height: AppSizes.spacing),
  //       SizedBox(
  //         height: rowHeight,
  //         child: Row(
  //           children: [
  //             _buildButton('0'),
  //             const SizedBox(width: AppSizes.spacing),
  //             Expanded(flex: 2, child: _buildClearButton(context)),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppSizes.portraitRowHeight, child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3')])),
        const SizedBox(height: AppSizes.spacing),
        SizedBox(height: AppSizes.portraitRowHeight, child: Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6')])),
        const SizedBox(height: AppSizes.spacing),
        SizedBox(height: AppSizes.portraitRowHeight, child: Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9')])),
        const SizedBox(height: AppSizes.spacing),
        SizedBox(
          height: AppSizes.portraitRowHeight,
          child: Row(
            children: [
              _buildButton('0'),
              const SizedBox(width: AppSizes.spacing),
              Expanded(flex: 2, child: _buildClearButton(context)),
            ],
          ),
        ),
      ],
    );
  }

  // Landscape layout: 4 columns.
  // Widget _buildLandscapeLayout(BuildContext context) {
  //   const double rowHeight = 50.0; // Slightly shorter rows for landscape
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       SizedBox(height: rowHeight, child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('4')])),
  //       const SizedBox(height: AppSizes.spacing),
  //       SizedBox(height: rowHeight, child: Row(children: [_buildButton('5'), _buildButton('6'), _buildButton('7'), _buildButton('8')])),
  //       const SizedBox(height: AppSizes.spacing),
  //       SizedBox(
  //         height: rowHeight,
  //         child: Row(
  //           children: [
  //             _buildButton('9'),
  //             const SizedBox(width: AppSizes.spacing),
  //             _buildButton('0'),
  //             const SizedBox(width: AppSizes.spacing),
  //             Expanded(flex: 2, child: _buildClearButton(context)),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppSizes.landscapeRowHeight, child: Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('4')])),
        const SizedBox(height: AppSizes.spacing),
        SizedBox(height: AppSizes.landscapeRowHeight, child: Row(children: [_buildButton('5'), _buildButton('6'), _buildButton('7'), _buildButton('8')])),
        const SizedBox(height: AppSizes.spacing),
        SizedBox(
          height: AppSizes.landscapeRowHeight,
          child: Row(
            children: [
              _buildButton('9'),
              const SizedBox(width: AppSizes.spacing),
              _buildButton('0'),
              const SizedBox(width: AppSizes.spacing),
              Expanded(flex: 2, child: _buildClearButton(context)),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildButton(String text) {
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
  //       child: ElevatedButton(
  //         onPressed: () => onDigit(int.parse(text)),
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.grey[300],
  //           foregroundColor: Colors.black,
  //           elevation: 0,
  //           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //           padding: EdgeInsets.zero,
  //         ),
  //         child: Text(
  //           text,
  //           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
        child: ElevatedButton(
          onPressed: () => onDigit(int.parse(text)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            foregroundColor: Colors.black,
            elevation: 0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: AppSizes.keypadButtonFontSize, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  // Widget _buildClearButton(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
  //     child: ElevatedButton(
  //       onPressed: onClear,
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.grey[300],
  //         foregroundColor: Colors.black,
  //         elevation: 0,
  //         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  //         padding: EdgeInsets.zero,
  //       ),
  //       child: const Text(
  //         'CLEAR',
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
  //       ),
  //     ),
  //   );
  // }


  Widget _buildClearButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing / 2),
      child: ElevatedButton(
        onPressed: onClear,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: EdgeInsets.zero,
        ),
        child: const Text(
          'CLEAR',
          style: TextStyle(fontSize: AppSizes.keypadClearFontSize, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}