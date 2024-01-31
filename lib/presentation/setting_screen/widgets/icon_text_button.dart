import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';

final class IconTextButton extends TappableWidget {
  final Icon _icon;
  final String _title;
  final Color _color;

  const IconTextButton({
    super.key,
    required super.onTap,
    required Icon icon,
    required String title,
    required Color color,
  })  : _icon = icon,
        _title = title,
        _color = color;

  @override
  Widget createContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxHeight * 0.5,
                child: FittedBox(child: _icon),
              ),
              SizedBox(width: Sizes.defaultPaddingOfWidth),
              Text(
                _title,
                style: TextStyles.settingButtonTextStyle.copyWith(color: _color),
              ),
            ],
          ),
        );
      },
    );
  }
}
