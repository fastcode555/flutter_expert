import 'package:flutter/material.dart';

/// 搜索主页面组件
///
/// 用于输入关键词、展示历史记录、热门搜索等。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-06-10
class SearchPageWidget extends StatelessWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: '请输入关键词',
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 执行搜索
                  },
                  child: const Text('搜索'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('历史记录', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Facebook')),
                Chip(label: Text('朋友圈')),
                // TODO: 替换为真实历史记录
              ],
            ),
            const SizedBox(height: 24),
            const Text('热门搜索', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('AI')),
                Chip(label: Text('社交')),
                Chip(label: Text('视频')),
                // TODO: 替换为真实热门搜索
              ],
            ),
          ],
        ),
      ),
    );
  }
} 