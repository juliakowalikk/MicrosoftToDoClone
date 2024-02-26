import 'package:flutter/material.dart';
import 'package:microsoft_to_do/style/app_typography.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Text('Lists', style: AppTypography.style3),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.lightbulb_outline,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('My Day', style: AppTypography.style1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('Thursday, 22 February', style: AppTypography.style2),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF7B6D68),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Add a Task',
                          style: AppTypography.style3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
