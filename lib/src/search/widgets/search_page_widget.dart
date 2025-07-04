import 'package:flutter/material.dart';
import 'package:flutter_expert/src/search/widgets/search_result_list_widget.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 搜索主页面组件
///
/// 用于输入关键词、展示历史记录、热门搜索等。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  final TextEditingController _searchController = TextEditingController();
  
  /// 搜索历史记录
  final List<String> _searchHistory = [
    'Flutter开发',
    '移动应用',
    '社交软件',
    'UI设计',
    '技术交流',
  ];
  
  /// 热门搜索
  final List<String> _hotSearches = [
    'AI技术',
    '前端开发',
    '后端架构',
    '数据库',
    '云服务',
    '机器学习',
    '区块链',
    '物联网',
  ];

  /// 执行搜索
  ///
  /// [keyword] 搜索关键词
  void _performSearch(String keyword) {
    if (keyword.trim().isEmpty) {
      Get.snackbar(
        '提示',
        '请输入搜索关键词',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // 添加到搜索历史（如果不存在的话）
    if (!_searchHistory.contains(keyword)) {
      setState(() {
        _searchHistory.insert(0, keyword);
        if (_searchHistory.length > 10) {
          _searchHistory.removeLast();
        }
      });
    }

    // 跳转到搜索结果页面
    Get.to(() => const SearchResultListWidget());
  }

  /// 点击历史记录
  ///
  /// [keyword] 历史关键词
  void _onHistoryTap(String keyword) {
    _searchController.text = keyword;
    _performSearch(keyword);
  }

  /// 点击热门搜索
  ///
  /// [keyword] 热门关键词
  void _onHotSearchTap(String keyword) {
    _searchController.text = keyword;
    _performSearch(keyword);
  }

  /// 清除搜索历史
  void _clearHistory() {
    Get.dialog(
      AlertDialog(
        title: '清除历史记录'.text.black.f16.bold.mk,
        content: '确定要清除所有搜索历史吗？'.text.grey600.f14.mk,
        actions: [
          TextButton(
            onPressed: Get.back,
            child: '取消'.text.grey600.f14.mk,
          ),
          TextButton(
            onPressed: () {
              setState(_searchHistory.clear);
              Get.back();
              Get.snackbar(
                '提示',
                '搜索历史已清除',
                snackPosition: SnackPosition.TOP,
              );
            },
            child: '确定'.text.red.f14.mk,
          ),
        ],
      ),
    );
  }

  /// 删除单个历史记录
  ///
  /// [keyword] 要删除的关键词
  void _removeHistoryItem(String keyword) {
    setState(() {
      _searchHistory.remove(keyword);
    });
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
        title: '搜索'.text.black.f18.bold.mk,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      
      // 主体内容
      body: column.children([
        // 搜索框区域
        _buildSearchSection(),
        h16,
        
        // 搜索历史区域
        if (_searchHistory.isNotEmpty) _buildHistorySection(),
        
        // 热门搜索区域
        _buildHotSearchSection(),
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
                hintText: '请输入关键词搜索',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              style: const TextStyle(fontSize: 16),
              onSubmitted: _performSearch,
            ),
          ),
          w12,
          
          // 搜索按钮
          GestureDetector(
            onTap: () => _performSearch(_searchController.text),
            child: container.blue.rounded8.ph16.pv8.child(
              '搜索'.text.white.f16.mk,
            ),
          ),
        ]),
        h12,
        
        // 搜索提示
        '支持搜索用户、动态、群组等内容'.text.grey600.f12.mk,
      ]),
    );
  }

  /// 构建搜索历史区域
  Widget _buildHistorySection() {
    return container.white.p16.mb16.child(
      column.children([
        // 标题栏
        row.spaceBetween.children([
          '搜索历史'.text.black.f16.bold.mk,
          GestureDetector(
            onTap: _clearHistory,
            child: '清除'.text.grey600.f14.mk,
          ),
        ]),
        h16,
        
        // 历史记录列表
        wrap.spacing8.runSpacing8.children(
          _searchHistory.map(_buildHistoryChip).toList(),
        ),
      ]),
    );
  }

  /// 构建历史记录标签
  ///
  /// [keyword] 关键词
  Widget _buildHistoryChip(String keyword) {
    return GestureDetector(
      onTap: () => _onHistoryTap(keyword),
      onLongPress: () => _removeHistoryItem(keyword),
      child: container.grey100.rounded16.ph12.pv6.child(
        row.children([
          Icons.history.icon.grey600.s16.mk,
          w6,
          keyword.text.grey800.f14.mk,
        ]),
      ),
    );
  }

  /// 构建热门搜索区域
  Widget _buildHotSearchSection() {
    return container.white.p16.child(
      column.children([
        // 标题栏
        row.spaceBetween.children([
          '热门搜索'.text.black.f16.bold.mk,
          Icons.whatshot.icon.orange.s20.mk,
        ]),
        h16,
        
        // 热门搜索网格
        gridview.crossAxisCount2.spacing12.mainSpacing8.shrinkWrap.neverScroll.dataBuilder<String>(
          _hotSearches,
          (context, index, keyword) => _buildHotSearchItem(keyword, index),
        ),
      ]),
    );
  }

  /// 构建热门搜索项
  ///
  /// [keyword] 关键词
  /// [index] 索引
  Widget _buildHotSearchItem(String keyword, int index) {
    // 前三名使用特殊颜色
    Color bgColor;
    Color textColor;
    IconData? icon;
    
    if (index < 3) {
      bgColor = [Colors.red, Colors.orange, Colors.blue][index].withOpacity(0.1);
      textColor = [Colors.red, Colors.orange, Colors.blue][index];
      icon = [Icons.looks_one, Icons.looks_two, Icons.looks_3][index];
    } else {
      bgColor = Colors.grey.shade100;
      textColor = Colors.grey.shade700;
      icon = Icons.trending_up;
    }
    
    return GestureDetector(
      onTap: () => _onHotSearchTap(keyword),
      child: container.color(bgColor).rounded8.p12.child(
        row.children([
          icon.icon.color(textColor).s16.mk,
          w8,
          keyword.text.color(textColor).f14.maxLine1.ellipsis.start.expanded.mk,
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 