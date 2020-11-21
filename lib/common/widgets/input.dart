import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/value.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,

  // 键盘类型
  TextInputType keyboardType = TextInputType.text,
  // 显示文本
  String hintText,
  // 是否是密码
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false,
      //  自动纠正
      obscureText: isPassword, //  隐藏输入内容,密码框
    ),
  );
}
