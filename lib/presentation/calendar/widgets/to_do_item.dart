import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_checkbox.dart';

final class ToDoItem extends StatelessWidget {
  final String _hint = '일정을 입력해 주세요.';

  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Sizes.toDoItemSize;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: Sizes.defaultHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SigppangECheckbox(onTap: () {}),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          Expanded(
            child: TextFormField(
              maxLines: 1,
              initialValue: 'To Do Item',
              style: TextStyles.toDoItemTextStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration.collapsed(hintText: _hint),
            ),
          ),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
