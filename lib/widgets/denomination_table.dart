// import 'package:flutter/material.dart';

// import '../constants/app_sizes.dart';
// import '../models/denomination.dart';

// class DenominationTable extends StatelessWidget {
//   final List<Denomination> denominations;

//   const DenominationTable({super.key, required this.denominations});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: AppSizes.cardElevation,
//       child: Padding(
//         padding: const EdgeInsets.all(AppSizes.padding),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Change Breakdown',
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             const SizedBox(height: AppSizes.spacing),
//             Expanded(
//               child: ListView.separated(
//                 itemCount: denominations.length,
//                 separatorBuilder: (_, _) => const Divider(height: 1),
//                 itemBuilder: (context, index) {
//                   final item = denominations[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           '${item.value} Taka',
//                           style: TextStyle(fontSize: AppSizes.tableFontSize),
//                         ),
//                         Text(
//                           item.count.toString(),
//                           style: TextStyle(fontSize: AppSizes.tableFontSize),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







//updated 



import 'package:flutter/material.dart';
import '../models/denomination.dart';

class DenominationTable extends StatelessWidget {
  final List<Denomination> denominations;

  const DenominationTable({super.key, required this.denominations});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    if (isPortrait) {
      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: denominations.map((d) => _buildRow(d)).toList(),
      );
    } else {
      // Split items into 2 columns for landscape layout matching
      final halfLength = (denominations.length / 2).ceil();
      final leftColumnItems = denominations.sublist(0, halfLength);
      final rightColumnItems = denominations.sublist(halfLength);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: leftColumnItems.map((d) => _buildRow(d)).toList(),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: rightColumnItems.map((d) => _buildRow(d)).toList(),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildRow(Denomination d) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '${d.value}: ${d.count}',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      ),
    );
  }
}