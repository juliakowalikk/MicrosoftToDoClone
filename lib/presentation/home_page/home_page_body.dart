import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:microsoft_to_do/presentation/home_page/widgets/home_page_list_view.dart';
import 'package:microsoft_to_do/presentation/home_page/widgets/home_page_modal_bottom_sheet.dart';
import 'package:microsoft_to_do/style/app_typography.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String date = DateFormat('EEEE, d. MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('My Day', style: AppTypography.style1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(date, style: AppTypography.style2),
            ),
            const HomePageListView(),
            const Spacer(),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const ModalBottomSheet()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B6D68),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Add a Task',
                          style: AppTypography.style3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
