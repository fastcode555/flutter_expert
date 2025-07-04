import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 消息输入框组件
///
/// 用于输入和发送聊天消息。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class MessageInputWidget extends StatefulWidget {
  /// 发送消息回调
  final Function(String)? onSendMessage;
  
  const MessageInputWidget({
    super.key,
    this.onSendMessage,
  });

  @override
  State<MessageInputWidget> createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isComposing = false;

  /// 发送消息
  ///
  /// [message] 消息内容
  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    // 调用父组件的回调
    widget.onSendMessage?.call(message);
    
    // 清空输入框
    _controller.clear();
    setState(() {
      _isComposing = false;
    });

    // 显示发送成功提示
    Get.snackbar(
      '',
      '消息发送成功',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// 处理输入变化
  ///
  /// [text] 输入文本
  void _onTextChanged(String text) {
    setState(() {
      _isComposing = text.trim().isNotEmpty;
    });
  }

  /// 显示更多选项
  void _showMoreOptions() {
    Get.bottomSheet(
      container.white.roundedT16.child(
        column.children([
          // 底部弹窗标题
          container.wFull.pv16.child(
            '更多选项'.text.black.f16.bold.center.mk,
          ),
          
          // 选项网格
          container.p16.child(
            gridview.crossAxisCount4.spacing16.shrinkWrap.neverScroll.builder(
              8,
              (context, index) {
                final options = [
                  {'title': '照片', 'icon': Icons.photo, 'color': Colors.blue},
                  {'title': '拍照', 'icon': Icons.camera_alt, 'color': Colors.green},
                  {'title': '文件', 'icon': Icons.folder, 'color': Colors.orange},
                  {'title': '位置', 'icon': Icons.location_on, 'color': Colors.red},
                  {'title': '语音', 'icon': Icons.mic, 'color': Colors.purple},
                  {'title': '视频', 'icon': Icons.videocam, 'color': Colors.teal},
                  {'title': '表情', 'icon': Icons.emoji_emotions, 'color': Colors.amber},
                  {'title': '名片', 'icon': Icons.contact_page, 'color': Colors.indigo},
                ];
                final option = options[index];
                return _buildOptionItem(
                  option['title']! as String,
                  option['icon']! as IconData,
                  option['color']! as Color,
                );
              },
            ),
          ),
          
          h16,
        ]),
      ),
    );
  }

  /// 构建选项项
  ///
  /// [title] 标题
  /// [icon] 图标
  /// [color] 颜色
  Widget _buildOptionItem(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.snackbar(
          '提示',
          '$title 功能开发中',
          snackPosition: SnackPosition.TOP,
        );
      },
      child: column.center.children([
        container.color(color.withOpacity(0.1)).s50.circle.center.child(
          icon.icon.color(color).s24.mk,
        ),
        h8,
        title.text.grey700.f12.center.mk,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return container.white.ph16.pv8.child(
      row.children([
        // 更多选项按钮
        GestureDetector(
          onTap: _showMoreOptions,
          child: container.grey100.circle.p8.child(
            Icons.add.icon.grey600.s20.mk,
          ),
        ),
        w12,
        
        // 输入框
        container.expanded.grey100.rounded20.ph16.pv8.child(
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '输入消息...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: const TextStyle(fontSize: 16),
            onChanged: _onTextChanged,
            onSubmitted: _sendMessage,
            maxLines: 4,
            minLines: 1,
          ),
        ),
        w12,
        
        // 发送按钮
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: _isComposing
              ? GestureDetector(
                  onTap: () => _sendMessage(_controller.text),
                  child: container.blue.circle.p8.child(
                    Icons.send.icon.white.s20.mk,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      '提示',
                      '语音消息功能开发中',
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  child: container.grey100.circle.p8.child(
                    Icons.mic.icon.grey600.s20.mk,
                  ),
                ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
} 