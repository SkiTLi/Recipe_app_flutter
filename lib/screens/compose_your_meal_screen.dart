import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/constance/theme_constance.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';

class ComposeYourMealScreen extends StatefulWidget {
  ComposeYourMealScreen({Key? key}) : super(key: key);

  @override
  State<ComposeYourMealScreen> createState() => _ComposeYourMealScreenState();
}

class _ComposeYourMealScreenState extends State<ComposeYourMealScreen> {
  final _titleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffold,
        elevation: 0,
        //without shadow
        title: const Text(
          'COMPOSE YOUR MEAL',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: ThemeColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.primary,
                  ),
                  '1',
                ),
              )),
          const SizedBox(width: 20),
        ],
        leading: Row(children: [
          const SizedBox(width: 20, height: 40),
          GestureDetector(
              behavior: HitTestBehavior.opaque, //click work on a empty area
              onTap: () => _navigateBack(context),
              child: SvgPicture.asset('assets/images/arrow.svg')),
        ]),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                child: Text(
                  style: ThemeFonts.bb18,
                  'Add ingredient',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomTextField(
                  controller: _titleController,
                  placeholder: 'Search ingredient',
                  style: ThemeFonts.rb14),
            )
          ],
        ),
      ),
    );
  }
}
