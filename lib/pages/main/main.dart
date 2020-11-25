import 'package:flutter/material.dart';
import 'package:flutter_news/common/apis/news.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/pages/main/ad_widget.dart';
import 'package:flutter_news/pages/main/categories_widget.dart';
import 'package:flutter_news/pages/main/channels_widget.dart';
import 'package:flutter_news/pages/main/news_item_widget.dart';
import 'package:flutter_news/pages/main/newsletter_widget.dart';
import 'package:flutter_news/pages/main/recommend_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NewsPageListResponseEntity _newsPageList; //新闻翻页
  NewsRecommendResponseEntity _newsRecommend; //新闻推荐
  List<CategoryResponseEntity> _categories; //分类
  List<ChannelResponseEntity> _channels; //频道

  String _selCategoryCode; //选中的分类Code

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories();
    _channels = await NewsAPI.channels();
    _newsRecommend = await NewsAPI.newsRecommend();
    _newsPageList = await NewsAPI.newsPageList();

    _selCategoryCode = _categories.first.code;
    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              setState(() {
                _selCategoryCode = item.code;
              });
            });
  }

  //抽取前先实现业务

  // 推荐阅读
  Widget _buildRecommend() {
    // 没接受到数据之前用骨架展示
    return _newsRecommend == null
        ? Container()
        : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChanelsWidget(
      channels: _channels,
      onTap: (ChannelResponseEntity item) {},
    );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
      height: duSetHeight(161 * 5 + 100.0),
    )
        : Column(
      children: _newsPageList.items.map((item) {
        // 新闻行
        List<Widget> widgets = <Widget>[
          newsItem(item),
          Divider(height: 1),
        ];

        // 每 5 条 显示广告
        int index = _newsPageList.items.indexOf(item);
        if (((index + 1) % 5) == 0) {
          widgets.addAll(<Widget>[
            adWidget(),
            Divider(height: 1),
          ]);
        }

        // 返回
        return Column(
          children: widgets,
        );
      }).toList(),
    );
  }

  // ad广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          _buildRecommend(),
          _buildChannels(),
          _buildNewsList(),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
