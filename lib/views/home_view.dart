import 'package:flutter/material.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/widgets/custom_add_note_dialog.dart';
import 'package:to_do/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 3,
        title: const Text(
          kTitle,
          style: TextStyle(
            color: Color(0XFF11111A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: HomeViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        backgroundColor: kPrimaryColor,
        tooltip: kToolTip,
        child: const Icon(Icons.add, size: 30),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const CustomAddNoteDialog();
            },
          );
        },
      ),
    );
  }
}
