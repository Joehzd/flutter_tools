import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TitleAnimView.dart';
import 'appTheme.dart';

class SkinSource extends StatefulWidget {
  @override
  SkinSourceState createState() => SkinSourceState();
}

class SkinSourceState extends State<SkinSource> with TickerProviderStateMixin {
  AnimationController animationController;
  List<Widget> listViews = <Widget>[];
  List<String> listTitle = <String>[
    '正常文字颜色',
    '选中文字颜色',
    '背 景 色',
    '红点背景色:',
    '红点文字颜色',
    '导航线颜色',
    '背景图(top_bg.png)',
    'icon1，活动(left_icon.png):',
    'icon2，发布(right_icon.png)',
    'icon3，搜索(icon3.png)',
    '正常文字颜色',
    '选中文字颜色',
    '背 景 色',
    '红点背景色:',
    '红点文字颜色',
    '背景图(tab_bg.png)',
    '首页正常态(icon_1_nor.png)',
    '首页选中态(icon_1_pre.png)',
    '人脉正常态(icon_2_nor.png)',
    '人脉选中态(icon_2_pre.png)',
    '机遇正常态(icon_3_nor.png)',
    '机遇选中态(icon_3_pre.png)',
    'im正常态(icon_4_nor.png)',
    'im选中态(icon_4_pre.png)',
    '我的正常态(icon_5_nor.png)',
    '我的选中态(icon_5_pre.png)'
  ];

  void addAllListData() {
    listViews.add(
      TitleAnimView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / 5) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: animationController,
        title: '顶部bar配置',
        icon: 'top_bar.png',
      ),
    );
    for (var i = 0; i < listTitle.length; i++) {
      if (i == 10) {
        listViews.add(
          Container(
            padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
            child: TitleAnimView(
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / 5) * 3, 1.0,
                          curve: Curves.fastOutSlowIn))),
              animationController: animationController,
              title: '底部bar配置',
              icon: 'bottom_bar.png',
            ),
          ),
        );
      }
      if (i == 16) {
        listViews.add(
          Padding(
            padding: EdgeInsets.only(left: 60, top: 20, right: 200, bottom: 0),
            child: Text(
              '底部tab icon 配置 ',
              style: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 0.0,
                color: FitnessAppTheme.nearlyDarkBlue,
              ),
            ),
          ),
        );
      }
      listViews.add(
        ListTile(
            contentPadding: EdgeInsets.only(
                left: i > 15 ? 150 : 100, top: 20, right: 200, bottom: 0),
            title: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon:Image.asset("must.png"),
                  hintText: '#ffffff',
                  labelText: listTitle[i]),
              autofocus: false,
            )),
      );
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animationController.forward();
    addAllListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: FitnessAppTheme.nearlyDarkBlue,
        title: new Text('换肤资源生成工具'),
      ),
      body: Center(
        child: ListView.builder(
          padding:
          EdgeInsets.only(left: 60, top: 20, right: 60, bottom: 0),
          itemCount: listViews.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            animationController.forward();
            return listViews[index];
          },
        ),
      ),
    );
  }
}
