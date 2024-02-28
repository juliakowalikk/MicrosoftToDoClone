import 'package:flutter/material.dart';

import 'home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const HomePageBody(),
          ],
        ),
      );
}
