import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart' as search;

/// 搜索结果列表组件
///
/// 用于展示搜索结果，支持多类型（用户、动态、群组等）。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SearchResultListWidget extends StatefulWidget {
  const SearchResultListWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultListWidget> createState() => _SearchResultListWidgetState();
}

class _SearchResultListWidgetState extends State<SearchResultListWidget> {
  final search.SearchController searchController = Get.find<search.SearchController>();

  /// 模拟搜索结果数据
  final List<Map<String, dynamic>> searchResults = [
    {
      'type': 'user',
      'id': '1',
      'name': '张小明',
      'subtitle': 'ID: 123456',
      'avatar': 'https://example.com/avatar1.png',
      'isFollowed': false,
    },
    {
      'type': 'user',
      'id': '2',
      'name': '李小红',
      'subtitle': 'ID: 789012',
      'avatar': 'https://example.com/avatar2.png',
      'isFollowed': true,
    },
    {
      'type': 'post',
      'id': '3',
      'name': '热门动态',
      'subtitle': '这是一条热门动态的内容预览...',
      'avatar': 'https://example.com/post1.png',
    },
    {
      'type': 'group',
      'id': '4',
      'name': 'Flutter开发交流群',
      'subtitle': '成员：1,234人',
      'avatar': 'https://example.com/group1.png',
      'isJoined': false,
    },
    {
      'type': 'user',
      'id': '5',
      'name': '王大华',
      'subtitle': 'ID: 345678',
      'avatar': 'https://example.com/avatar3.png',
      'isFollowed': false,
    },
  ];

  /// 处理用户搜索结果点击
  ///
  /// [result] 搜索结果数据
  void _handleUserTap(Map<String, dynamic> result) {
    Get.snackbar(
      '提示',
      '跳转用户详情页：${result['name']}',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 处理动态搜索结果点击
  ///
  /// [result] 搜索结果数据
  void _handlePostTap(Map<String, dynamic> result) {
    Get.snackbar(
      '提示',
      '跳转动态详情页：${result['name']}',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 处理群组搜索结果点击
  ///
  /// [result] 搜索结果数据
  void _handleGroupTap(Map<String, dynamic> result) {
    Get.snackbar(
      '提示',
      '跳转群组详情页：${result['name']}',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 关注/取消关注用户
  ///
  /// [userId] 用户ID
  /// [isFollowed] 当前关注状态
  void _toggleFollow(String userId, bool isFollowed) {
    setState(() {
      final index = searchResults.indexWhere((item) => item['id'] == userId);
      if (index != -1) {
        searchResults[index]['isFollowed'] = !isFollowed;
      }
    });
    
    Get.snackbar(
      '提示',
      isFollowed ? '已取消关注' : '已关注',
      snackPosition: SnackPosition.TOP,
      backgroundColor: isFollowed ? Colors.orange : Colors.green,
      colorText: Colors.white,
    );
  }

  /// 加入/退出群组
  ///
  /// [groupId] 群组ID
  /// [isJoined] 当前加入状态
  void _toggleJoinGroup(String groupId, bool isJoined) {
    setState(() {
      final index = searchResults.indexWhere((item) => item['id'] == groupId);
      if (index != -1) {
        searchResults[index]['isJoined'] = !isJoined;
      }
    });
    
    Get.snackbar(
      '提示',
      isJoined ? '已退出群组' : '已加入群组',
      snackPosition: SnackPosition.TOP,
      backgroundColor: isJoined ? Colors.orange : Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 应用栏配置
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '搜索结果'.text.black.f18.bold.mk,
        actions: [
          container.pr16.child(
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  '提示',
                  '搜索筛选功能开发中',
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: Icons.filter_list.icon.black.s20.mk,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      
      // 主体内容
      body: searchResults.isEmpty
          ? _buildEmptyState()
          : listview.separated16.p16.dataBuilder<Map<String, dynamic>>(
              searchResults,
              (context, index, result) => _buildSearchResultItem(result),
            ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState() {
    return container.wFull.hFull.center.child(
      column.center.children([
        Icons.search_off.icon.grey400.s64.mk,
        h16,
        '暂无搜索结果'.text.grey600.f16.mk,
        h8,
        '试试其他关键词吧'.text.grey400.f14.mk,
      ]),
    );
  }

  /// 构建搜索结果项
  ///
  /// [result] 搜索结果数据
  Widget _buildSearchResultItem(Map<String, dynamic> result) {
    final String type = result['type'];
    
    return GestureDetector(
      onTap: () {
        switch (type) {
          case 'user':
            _handleUserTap(result);
            break;
          case 'post':
            _handlePostTap(result);
            break;
          case 'group':
            _handleGroupTap(result);
            break;
        }
      },
      child: container.white.rounded12.cardShadow.child(
        row.children([
          // 头像/图标
          _buildAvatar(result),
          w16,
          
          // 主要内容
          column.crossStart.expanded.children([
            row.spaceBetween.children([
              // 标题和类型标签
              row.children([
                result['name'].toString().text.black.f16.bold.mk,
                w8,
                _buildTypeTag(type),
              ]),
              
              // 操作按钮
              _buildActionButton(result),
            ]),
            h4,
            result['subtitle'].toString().text.grey600.f14.mk,
          ]),
        ]),
      ),
    );
  }

  /// 构建头像
  ///
  /// [result] 搜索结果数据
  Widget _buildAvatar(Map<String, dynamic> result) {
    final String type = result['type'];
    IconData iconData;
    Color bgColor;
    
    switch (type) {
      case 'user':
        iconData = Icons.person;
        bgColor = Colors.blue;
        break;
      case 'post':
        iconData = Icons.article;
        bgColor = Colors.green;
        break;
      case 'group':
        iconData = Icons.group;
        bgColor = Colors.orange;
        break;
      default:
        iconData = Icons.help;
        bgColor = Colors.grey;
    }
    
    return container.s50.circle.color(bgColor.withOpacity(0.1)).center.child(
      iconData.icon.color(bgColor).s24.mk,
    );
  }

  /// 构建类型标签
  ///
  /// [type] 结果类型
  Widget _buildTypeTag(String type) {
    String label;
    Color color;
    
    switch (type) {
      case 'user':
        label = '用户';
        color = Colors.blue;
        break;
      case 'post':
        label = '动态';
        color = Colors.green;
        break;
      case 'group':
        label = '群组';
        color = Colors.orange;
        break;
      default:
        label = '其他';
        color = Colors.grey;
    }
    
    return container.ph8.pv2.rounded12.color(color.withOpacity(0.1)).child(
      label.text.color(color).f12.mk,
    );
  }

  /// 构建操作按钮
  ///
  /// [result] 搜索结果数据
  Widget _buildActionButton(Map<String, dynamic> result) {
    final String type = result['type'];
    
    switch (type) {
      case 'user':
        final bool isFollowed = result['isFollowed'] ?? false;
        return GestureDetector(
          onTap: () => _toggleFollow(result['id'], isFollowed),
          child: container
              .ph12
              .pv6
              .rounded6
              .color(isFollowed ? Colors.grey.shade200 : Colors.blue)
              .child(
                (isFollowed ? '已关注' : '关注')
                    .text
                    .color(isFollowed ? Colors.grey.shade600 : Colors.white)
                    .f12
                    .mk,
              ),
        );
        
      case 'group':
        final bool isJoined = result['isJoined'] ?? false;
        return GestureDetector(
          onTap: () => _toggleJoinGroup(result['id'], isJoined),
          child: container
              .ph12
              .pv6
              .rounded6
              .color(isJoined ? Colors.grey.shade200 : Colors.orange)
              .child(
                (isJoined ? '已加入' : '加入')
                    .text
                    .color(isJoined ? Colors.grey.shade600 : Colors.white)
                    .f12
                    .mk,
              ),
        );
        
      case 'post':
        return Icons.chevron_right.icon.grey400.s20.mk;
        
      default:
        return SizedBox.shrink();
    }
  }
} 