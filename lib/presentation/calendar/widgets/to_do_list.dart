import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 8.h),
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
          SizedBox(width: 8.w),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
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
        return ToDoItem();
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 4.h,
          color: Colors.transparent,
        );
      },
    );
  }
}
