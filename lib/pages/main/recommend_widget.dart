import 'package:flutter/material.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/value.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

/// 推荐阅读组件
Widget recommendWidget(
    NewsRecommendResponseEntity newsRecommendResponseEntity) {
  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        imageCached(
          newsRecommendResponseEntity.thumbnail,
          width: duSetWidth(335),
          height: duSetHeight(290),
        ),

        // 作者
        Container(
          margin: EdgeInsets.only(top: duSetHeight(14)),
          child: Text(
            newsRecommendResponseEntity.author,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElement,
              fontSize: duSetFontSize(14),
            ),
          ),
        ),

        // 标题
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Text(
            newsRecommendResponseEntity.title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              fontSize: duSetFontSize(24),
              height: 1,
            ),
          ),
        ),

        // 一行3列
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 分类
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  newsRecommendResponseEntity.category,
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 添加时间
              Container(
                width: duSetWidth(15),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120,
                ),
                child: Text(
                  '• ${duTimeLineFormat(newsRecommendResponseEntity.addtime)}',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}
