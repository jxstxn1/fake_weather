import 'package:flutter/material.dart';

import 'city_input_field.dart';

class BuildInitialInput extends StatelessWidget {
  const BuildInitialInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CityInputField(),
    );
  }
}
