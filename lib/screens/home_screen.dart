// import 'package:flutter/material.dart';

// import '../constants/app_sizes.dart';
// import '../models/denomination.dart';
// import '../services/change_calculator.dart';
// import '../widgets/amount_display.dart';
// import '../widgets/denomination_table.dart';
// import '../widgets/keypad.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _amount = 0;

//   void _appendDigit(int digit) {
//     setState(() {
//       final candidate = _amount * 10 + digit;
//       if (candidate <= 999999999) {
//         _amount = candidate;
//       }
//     });
//   }

//   void _clearAmount() {
//     setState(() {
//       _amount = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     final isPortrait = orientation == Orientation.portrait;
//     final change = calculateChange(_amount);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Vangti Chai'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(AppSizes.padding),
//           child: isPortrait
//               ? _buildPortraitLayout(change)
//               : _buildLandscapeLayout(change),
//         ),
//       ),
//     );
//   }

//   Widget _buildPortraitLayout(List<Denomination> change) {
//     return Column(
//       children: [
//         AmountDisplay(amount: _amount),
//         const SizedBox(height: AppSizes.spacing),
//         Expanded(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(child: DenominationTable(denominations: change)),
//               const SizedBox(width: AppSizes.spacing),
//               Expanded(child: Keypad(onDigit: _appendDigit, onClear: _clearAmount)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLandscapeLayout(List<Denomination> change) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Column(
//             children: [
//               AmountDisplay(amount: _amount),
//               const SizedBox(height: AppSizes.spacing),
//               Expanded(child: DenominationTable(denominations: change)),
//             ],
//           ),
//         ),
//         const SizedBox(width: AppSizes.spacing),
//         Expanded(flex: 3, child: Keypad(onDigit: _appendDigit, onClear: _clearAmount)),
//       ],
//     );
//   }
// }






//updated


import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../models/denomination.dart';
import '../services/change_calculator.dart';
import '../widgets/amount_display.dart';
import '../widgets/denomination_table.dart';
import '../widgets/keypad.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _amount = 0;

  void _appendDigit(int digit) {
    setState(() {
      final candidate = _amount * 10 + digit;
      // Prevent integer overflow boundary limits
      if (candidate <= 999999999) {
        _amount = candidate;
      }
    });
  }

  void _clearAmount() {
    setState(() {
      _amount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;
    final change = calculateChange(_amount);

    return Scaffold(
      backgroundColor: Colors.white, // Matches the mockup's clean plain canvas background
      appBar: AppBar(
        title: const Text(
          'VangtiChai',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFF388E3C), // The classic Material Green AppBar color from the screenshot
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: isPortrait
              ? _buildPortraitLayout(change)
              : _buildLandscapeLayout(change),
        ),
      ),
    );
  }

  // Portrait layout: Title at top, Table on left, Keypad on right
  Widget _buildPortraitLayout(List<Denomination> change) {
    return Column(
      children: [
        AmountDisplay(amount: _amount),
        const SizedBox(height: AppSizes.spacing),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: DenominationTable(denominations: change),
              ),
              const SizedBox(width: AppSizes.spacing),
              Expanded(
                flex: 5,
                child: Keypad(onDigit: _appendDigit, onClear: _clearAmount),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Landscape layout: Title spans across top, Table splits into double columns below on the left, Keypad on the right
  Widget _buildLandscapeLayout(List<Denomination> change) {
    return Column(
      children: [
        AmountDisplay(amount: _amount), // Stretches across the full top width
        const SizedBox(height: AppSizes.spacing),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: DenominationTable(denominations: change), // Will draw dual columns automatically
              ),
              const SizedBox(width: AppSizes.spacing),
              Expanded(
                flex: 5,
                child: Keypad(onDigit: _appendDigit, onClear: _clearAmount), // Will draw 4 columns automatically
              ),
            ],
          ),
        ),
      ],
    );
  }
}