import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 动态流列表组件
///
/// 用于展示动态流的列表，支持下拉刷新、点赞、评论等交互。
/// 使用 flutter_tailwind 实现现代化的卡片式设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class FeedListWidget extends StatefulWidget {
  const FeedListWidget({super.key});

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  List<Map<String, dynamic>> _feedData = [];

  @override
  void initState() {
    super.initState();
    _loadFeedData();
  }

  /// 加载动态数据
  ///
  /// 模拟从服务器加载动态流数据
  void _loadFeedData() {
    // TODO: 集成 FeedController 获取真实数据
    _feedData = [
      {
        'id': 1,
        'username': '张三',
        'avatar': 'https://example.com/avatar1.png',
        'content': '今天天气真好，出去走走心情都变好了 🌞',
        'time': '2小时前',
        'likes': 25,
        'comments': 8,
        'isLiked': false,
      },
      {
        'id': 2,
        'username': '李四',
        'avatar': 'https://example.com/avatar2.png',
        'content': '分享一张今天拍的照片，大家觉得怎么样？',
        'time': '4小时前',
        'likes': 42,
        'comments': 15,
        'isLiked': true,
      },
      {
        'id': 3,
        'username': '王五',
        'avatar': 'https://example.com/avatar3.png',
        'content': '终于完成了这个项目，感谢团队的支持！🎉',
        'time': '1天前',
        'likes': 67,
        'comments': 23,
        'isLiked': false,
      },
    ];
  }

  /// 处理点赞操作
  ///
  /// [index] 动态项索引
  void _toggleLike(int index) {
    setState(() {
      _feedData[index]['isLiked'] = !_feedData[index]['isLiked'];
      if (_feedData[index]['isLiked']) {
        _feedData[index]['likes']++;
      } else {
        _feedData[index]['likes']--;
      }
    });

    Get.snackbar(
      '',
      _feedData[index]['isLiked'] ? '点赞成功' : '取消点赞',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  /// 处理评论操作
  ///
  /// [index] 动态项索引
  void _showComments(int index) {
    Get.snackbar(
      '评论',
      '评论功能开发中',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// 下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _loadFeedData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: '动态'.text.black.f18.bold.mk,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.snackbar('提示', '发布动态功能开发中');
            },
            child: container.pr16.child(
              Icons.add.icon.blue.s24.mk,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: _feedData.isEmpty
            ? _buildEmptyState()
            : listview.pv8.separated12.ph16.builder(
                _feedData.length,
                (context, index) => _buildFeedItem(index),
              ),
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return container.wFull.hFull.center.child(
      column.center.children([
        Icons.dynamic_feed.icon.grey400.s64.mk,
        h16,
        '暂无动态'.text.grey600.f16.mk,
        h8,
        '下拉刷新试试'.text.grey400.f14.mk,
      ]),
    );
  }

  /// 构建动态项
  ///
  /// [index] 动态项索引
  Widget _buildFeedItem(int index) {
    final item = _feedData[index];
    
    return container.white.rounded12.cardShadow.child(
      column.children([
        // 用户信息头部
        container.ph16.pv12.child(
          row.children([
            // 头像
            container.s40.circle.grey200.child(
              Icons.person.icon.grey600.s20.mk,
            ),
            w12,
            // 用户名和时间
            Expanded(
              child: column.children([
                container.wFull.child(
                  item['username'].toString().text.black87.f14.bold.mk,
                ),
                h4,
                container.wFull.child(
                  item['time'].toString().text.grey.f12.mk,
                ),
              ]),
            ),
            // 更多按钮
            GestureDetector(
              onTap: () {
                Get.snackbar('提示', '更多选项开发中');
              },
              child: Icons.more_horiz.icon.grey600.s20.mk,
            ),
          ]),
        ),
        
        // 动态内容
        container.ph16.pv8.child(
          container.wFull.child(
            item['content'].toString().text.black87.f14.mk,
          ),
        ),
        
        // 互动区域
        container.ph16.pv12.child(
          row.spaceBetween.children([
            // 点赞按钮
            GestureDetector(
              onTap: () => _toggleLike(index),
              child: row.children([
                (item['isLiked'] ? Icons.thumb_up : Icons.thumb_up_outlined)
                    .icon
                    .color(item['isLiked'] ? Colors.blue : Colors.grey)
                    .s20
                    .mk,
                w8,
                item['likes'].toString().text
                    .color(item['isLiked'] ? Colors.blue : Colors.grey)
                    .f12
                    .mk,
              ]),
            ),
            
            // 评论按钮
            GestureDetector(
              onTap: () => _showComments(index),
              child: row.children([
                Icons.comment_outlined.icon.grey600.s20.mk,
                w8,
                item['comments'].toString().text.grey.f12.mk,
              ]),
            ),
            
            // 分享按钮
            GestureDetector(
              onTap: () {
                Get.snackbar('提示', '分享功能开发中');
              },
              child: row.children([
                Icons.share_outlined.icon.grey600.s20.mk,
                w8,
                '分享'.text.grey.f12.mk,
              ]),
            ),
          ]),
        ),
      ]),
    );
  }
} 