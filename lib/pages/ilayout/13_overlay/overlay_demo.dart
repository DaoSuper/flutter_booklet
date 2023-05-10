import 'package:flutter/material.dart';

import 'alertable.dart';

class OverlayDemo extends StatefulWidget {
  const OverlayDemo({Key? key}) : super(key: key);

  @override
  State<OverlayDemo> createState() => _OverlayDemoState();
}

class _OverlayDemoState extends State<OverlayDemo> {
  final List<String> books = ['《诗经》', '《资治通鉴》', '《史记》', '《狂人日记》'];

  Map<String, String> introductionMap = {
    '《诗经》': '《诗经》，是中国古代诗歌开端，最早的一部诗歌总集，收集了西周初年至春秋中叶（前11世纪至前6世纪）的诗歌，共311篇。',
    '《资治通鉴》': '《资治通鉴》，是由北宋史学家司马光主编的一部多卷本编年体史书，共294卷，历时十九年完成。',
    '《史记》':
        '《史记》，二十四史之一，最初称为《太史公书》或《太史公记》、《太史记》，是西汉史学家司马迁撰写的纪传体史书，是中国历史上第一部纪传体通史。',
    '《狂人日记》':
        '《狂人日记》是鲁迅创作的第一个短篇白话文日记体小说，也是中国第一部现代白话小说。该文首发于1918年5月15日4卷5号的《新青年》月刊，后收入《呐喊》集。',
    '《西游记》':
        '《西游记》是中国古代第一部浪漫主义章回体长篇神魔小说。现存明刊百回本《西游记》均无作者署名，清代学者吴玉搢等首先提出《西游记》作者是明代吴承恩。',
    '《红楼梦》':
        '《红楼梦》是中国古代章回体长篇小说，中国古典四大名著之一，通行本共120回，一般认为前80回是清代作家曹雪芹所著，后40回作者为无名氏，整理者为程伟元、高鹗。',
    '《三国演义》':
        '《三国演义》是元末明初小说家罗贯中根据陈寿《三国志》和裴松之注解以及民间三国故事传说经过艺术加工创作而成的长篇章回体历史演义小说。',
    '《水浒传》': '《水浒传》是元末明初施耐庵（现存刊本署名大多有施耐庵、罗贯中两人中的一人，或两人皆有）编著的章回体长篇小说。',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 15,
          children: books.map((e) => Alertable(
            content : buildContent(e),
            alertContent: Text(
              introductionMap[e] ?? '暂无简介',
            ),)
          ).toList(),
        ),
      ),
    );
  }

  Widget buildContent(String name){
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(.5, .5),
                  blurRadius: .5,
                  spreadRadius: .1,
                  color: Colors.blueAccent)
            ],
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ));
  }
}