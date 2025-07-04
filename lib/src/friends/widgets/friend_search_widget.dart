import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 好友搜索/添加组件
///
/// 用于搜索用户并发起加好友请求。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class FriendSearchWidget extends StatefulWidget {
  const FriendSearchWidget({super.key});

  @override
  State<FriendSearchWidget> createState() => _FriendSearchWidgetState();
}

class _FriendSearchWidgetState extends State<FriendSearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  
  /// 模拟搜索结果
  List<Map<String, dynamic>> searchResults = [];

  /// 执行搜索
  ///
  /// 根据输入的关键词搜索用户
  Future<void> _performSearch() async {
    final keyword = _searchController.text.trim();
    if (keyword.isEmpty) {
      Get.snackbar(
        '提示',
        '请输入搜索关键词',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    setState(() {
      _isSearching = true;
    });

    // 模拟网络请求延迟
    await Future.delayed(const Duration(seconds: 1));

    // 模拟搜索结果
    setState(() {
      searchResults = [
        {
          'id': '1',
          'username': 'user_$keyword',
          'nickname': '搜索用户_$keyword',
          'avatar': 'https://example.com/avatar1.png',
          'friendStatus': 'none', // none, pending, friend
          'mutualFriends': 5,
        },
        {
          'id': '2',
          'username': '${keyword}_friend',
          'nickname': '$keyword的朋友',
          'avatar': 'https://example.com/avatar2.png',
          'friendStatus': 'pending',
          'mutualFriends': 12,
        },
        {
          'id': '3',
          'username': 'test_$keyword',
          'nickname': '测试用户_$keyword',
          'avatar': 'https://example.com/avatar3.png',
          'friendStatus': 'friend',
          'mutualFriends': 3,
        },
      ];
      _isSearching = false;
    });
  }

  /// 发送加好友请求
  ///
  /// [userId] 目标用户ID
  /// [username] 目标用户名
  void _sendFriendRequest(String userId, String username) {
    setState(() {
      final index = searchResults.indexWhere((user) => user['id'] == userId);
      if (index != -1) {
        searchResults[index]['friendStatus'] = 'pending';
      }
    });

    Get.snackbar(
      '提示',
      '已向 $username 发送好友请求',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// 取消好友请求或删除好友
  ///
  /// [userId] 目标用户ID
  /// [username] 目标用户名
  /// [currentStatus] 当前好友状态
  void _handleFriendAction(String userId, String username, String currentStatus) {
    var action = '';
    var newStatus = 'none';
    
    if (currentStatus == 'pending') {
      action = '已取消好友请求';
      newStatus = 'none';
    } else if (currentStatus == 'friend') {
      action = '已删除好友';
      newStatus = 'none';
    }

    setState(() {
      final index = searchResults.indexWhere((user) => user['id'] == userId);
      if (index != -1) {
        searchResults[index]['friendStatus'] = newStatus;
      }
    });

    Get.snackbar(
      '提示',
      '$action：$username',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  /// 查看用户详情
  ///
  /// [user] 用户数据
  void _viewUserDetail(Map<String, dynamic> user) {
    Get.snackbar(
      '提示',
      '跳转用户详情页：${user['nickname']}',
      snackPosition: SnackPosition.TOP,
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
          onTap: Get.back,
          child: Icons.arrow_back_ios.icon.black.s20.mk,
        ),
        title: '添加好友'.text.black.f18.bold.mk,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      
      // 主体内容
      body: column.children([
        // 搜索框区域
        _buildSearchSection(),
        h16,
        
        // 搜索结果区域
        _buildSearchResults(),
      ]),
    );
  }

  /// 构建搜索区域
  Widget _buildSearchSection() {
    return container.white.p16.child(
      column.children([
        // 搜索输入框
        row.children([
          // 输入框
          container.expanded.border1.borderGrey300.rounded8.ph12.pv8.child(
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: '请输入用户名/ID搜索',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 16),
              onSubmitted: (value) => _performSearch(),
            ),
          ),
          w12,
          
          // 搜索按钮
          GestureDetector(
            onTap: _performSearch,
            child: container.blue.rounded8.ph16.pv8.child(
              _isSearching
                  ? container.s20.child(
                      const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : '搜索'.text.white.f16.mk,
            ),
          ),
        ]),
        h12,
        
        // 搜索提示
        '支持搜索用户名、ID或昵称'.text.grey600.f12.mk,
      ]),
    );
  }

  /// 构建搜索结果区域
  Widget _buildSearchResults() {
    if (_isSearching) {
      return container.expanded.center.child(
        column.center.children([
          const CircularProgressIndicator(),
          h16,
          '搜索中...'.text.grey600.f16.mk,
        ]),
      );
    }

    if (searchResults.isEmpty && _searchController.text.isNotEmpty) {
      return container.expanded.center.child(
        column.center.children([
          Icons.search_off.icon.grey400.s64.mk,
          h16,
          '未找到相关用户'.text.grey600.f16.mk,
          h8,
          '试试其他关键词吧'.text.grey400.f14.mk,
        ]),
      );
    }

    if (searchResults.isEmpty) {
      return container.expanded.center.child(
        column.center.children([
          Icons.person_search.icon.grey400.s64.mk,
          h16,
          '输入用户名开始搜索'.text.grey600.f16.mk,
          h8,
          '找到你想添加的好友'.text.grey400.f14.mk,
        ]),
      );
    }

    return container.expanded.child(
      listview.separated16.ph16.dataBuilder<Map<String, dynamic>>(
        searchResults,
        (context, index, user) => _buildUserResultItem(user),
      ),
    );
  }

  /// 构建用户搜索结果项
  ///
  /// [user] 用户数据
  Widget _buildUserResultItem(Map<String, dynamic> user) {
    final String friendStatus = user['friendStatus'] ?? 'none';
    final int mutualFriends = user['mutualFriends'] ?? 0;

    return GestureDetector(
      onTap: () => _viewUserDetail(user),
      child: container.white.rounded12.cardShadow.child(
        row.children([
          // 头像
          container.s60.circle.grey200.center.child(
            Icons.person.icon.grey600.s30.mk,
          ),
          w16,
          
          // 用户信息
          column.crossStart.expanded.children([
            // 昵称和用户名
            user['nickname'].toString().text.black.f16.bold.mk,
            h4,
            'ID: ${user['username']}'.text.grey600.f14.mk,
            h4,
            
            // 共同好友
            if (mutualFriends > 0)
              '$mutualFriends个共同好友'.text.blue.f12.mk,
          ]),
          w16,
          
          // 操作按钮
          _buildActionButton(user, friendStatus),
        ]),
      ),
    );
  }

  /// 构建操作按钮
  ///
  /// [user] 用户数据
  /// [friendStatus] 好友状态
  Widget _buildActionButton(Map<String, dynamic> user, String friendStatus) {
    switch (friendStatus) {
      case 'none':
        return GestureDetector(
          onTap: () => _sendFriendRequest(user['id'], user['nickname']),
          child: container.blue.rounded6.ph12.pv6.child(
            '加好友'.text.white.f14.mk,
          ),
        );
        
      case 'pending':
        return GestureDetector(
          onTap: () => _handleFriendAction(user['id'], user['nickname'], friendStatus),
          child: container.orange.rounded6.ph12.pv6.child(
            '已申请'.text.white.f14.mk,
          ),
        );
        
      case 'friend':
        return GestureDetector(
          onTap: () => _handleFriendAction(user['id'], user['nickname'], friendStatus),
          child: container.grey300.rounded6.ph12.pv6.child(
            '已是好友'.text.grey600.f14.mk,
          ),
        );
        
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 