// import 'package:flutter/material.dart';

// import '../constants/app_sizes.dart';

// class AmountDisplay extends StatelessWidget {
//   final int amount;

//   const AmountDisplay({super.key, required this.amount});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: AppSizes.cardElevation,
//       child: Padding(
//         padding: const EdgeInsets.all(AppSizes.padding),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Taka:',
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             Text(
//               amount.toString(),
//               style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                     fontSize: AppSizes.displayFontSize,
//                     fontWeight: FontWeight.bold,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








//updated



import 'package:flutter/material.dart';

class AmountDisplay extends StatelessWidget {
  final int amount;

  const AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    // Show empty space if amount is 0, matching the first portrait screenshot
    final displayValue = amount == 0 ? '' : ' $amount';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Taka:$displayValue',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}