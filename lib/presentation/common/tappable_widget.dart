import 'package:flutter/material.dart';

abstract class TappableWidget extends StatelessWidget {
  final Function() _onTap;

  const TappableWidget({
    super.key,
    required Function() onTap,
  }) : _onTap = onTap;

  Widget createContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: createContent(context),
    );
  }
}
