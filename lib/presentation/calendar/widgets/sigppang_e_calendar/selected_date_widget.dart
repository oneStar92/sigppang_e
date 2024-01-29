import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_style_constants.dart';

final class SelectedDate extends StatelessWidget {
  final Widget _logo;
  final String _selectedDay;

  const SelectedDate({
    super.key,
    required Widget logo,
    required String selectedDay,
  })  : _logo = logo,
        _selectedDay = selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _logo,
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Center(
              child: Text(
                _selectedDay,
                textAlign: TextAlign.center,
                style: TextStyleConstants.selectedDay.value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
