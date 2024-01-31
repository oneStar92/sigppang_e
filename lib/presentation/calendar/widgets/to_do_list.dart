import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item_widget.dart';

final class ToDoList extends StatelessWidget {
  final String _title;

  const ToDoList({
    super.key,
    required String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titleWidget(),
        SizedBox(height: Sizes.defaultPaddingOfHeight),
        _toDoList(),
      ],
    );
  }

  Widget _titleWidget() {
    final size = Sizes.toDoTitleSize;
    return SizedBox(
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_title, style: TextStyles.toDoListTitleTextStyle),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _toDoList() {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ToDoItem();
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: Sizes.separatorHeight,
          color: Colors.transparent,
        );
      },
    );
  }
}
