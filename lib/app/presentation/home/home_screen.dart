import 'package:flutter/material.dart';
import 'package:flutter_structure_application/app/core/constants/dimens.dart';
import 'package:flutter_structure_application/app/presentation/components/bottom_bar.dart';
import 'package:flutter_structure_application/app/presentation/components/theme_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: const [
          ThemeButtonWidget(),
        ],
      ),
      bottomNavigationBar: const MyBottomBar(),
      body: SingleChildScrollView(
        padding: UiDimens.horizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home Screen',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Total Bills: 0',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Paid Bills: 0',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.green,
                  ),
            ),
            Text(
              'Unpaid Bills: 0',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
