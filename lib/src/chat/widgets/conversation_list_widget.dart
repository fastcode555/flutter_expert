import 'package:flutter/material.dart';
import 'package:flutter_expert/src/chat/controllers/conversation_controller.dart';
import 'package:flutter_expert/src/chat/models/conversation_model.dart';
import 'package:flutter_expert/src/chat/widgets/message_list_widget.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 会话列表页面组件
///
/// 展示所有聊天会话的列表，支持搜索、删除、置顶等操作。
///
/// 创建时间：2024-12-19
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ConversationListWidget extends StatelessWidget {
  const ConversationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConversationController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(controller),
      body: column.children([
        _buildSearchBar(controller),
        Expanded(child: _buildConversationList(controller)),
      ]),
    );
  }

  /// 构建应用栏
  AppBar _buildAppBar(ConversationController controller) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: '消息'.text.f18.bold.black.mk,
      actions: [
        GestureDetector(
          onTap: () {
            Get.snackbar(
              '提示',
              '发起新聊天功能开发中...',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
          child: container.pr16.child(
            Icons.add.icon.s24.grey700.mk,
          ),
        ),
      ],
    );
  }

  /// 构建搜索栏
  Widget _buildSearchBar(ConversationController controller) {
    return container.white.p16.child(
      row.spacing12.children([
        Icons.search.icon.grey500.s20.mk,
        Expanded(
          child: TextFormField(
            onChanged: controller.searchConversations,
            decoration: const InputDecoration(
              hintText: '搜索聊天记录',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Obx(() => 
          controller.searchKeyword.value.isNotEmpty
              ? GestureDetector(
                  onTap: controller.clearSearch,
                  child: Icons.clear.icon.s20.grey500.mk,
                )
              : const SizedBox.shrink(),
        ),
      ]),
    );
  }

  /// 构建会话列表
  Widget _buildConversationList(ConversationController controller) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('加载中...', style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      }

      final conversations = controller.filteredConversations;

      if (conversations.isEmpty) {
        return Center(
          child: column.center.spacing16.children([
            Icons.chat_bubble_outline.icon.grey400.s64.mk,
            '暂无会话'.text.grey500.f16.mk,
            '点击右上角 + 开始新聊天'.text.grey400.f14.mk,
          ]),
        );
      }

      return RefreshIndicator(
        onRefresh: controller.refreshConversations,
        child: listview.separated8.p16.dataBuilder<ConversationModel>(
          conversations,
          (context, index, conversation) => _buildConversationItem(
            conversation,
            controller,
          ),
        ),
      );
    });
  }

  /// 构建单个会话项
  Widget _buildConversationItem(
    ConversationModel conversation,
    ConversationController controller,
  ) {
    return GestureDetector(
      onTap: () => _onConversationTap(conversation, controller),
      onLongPress: () => _showConversationMenu(conversation, controller),
      child: container.white.rounded12.p16.cardShadow.child(
        row.spacing12.children([
          _buildAvatar(conversation),
          column.crossStart.expanded.spacing4.children([
            row.children([
              conversation.nickname.text.f16.bold.black.expanded.mk,
              if (conversation.status == 'muted')
                Icons.volume_off.icon.grey400.s16.mk,
            ]),
            Text(
              conversation.lastMessage,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ]),
          column.crossEnd.spacing4.children([
            _formatTime(conversation.lastMessageTime).text.f12.grey500.mk,
            if (conversation.unreadCount > 0)
              Container(
                constraints: const BoxConstraints(minWidth: 20),
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: (conversation.unreadCount > 99
                      ? '99+'
                      : conversation.unreadCount.toString())
                  .text.white.f10.bold.mk,
                ),
              )
            else
              const SizedBox(height: 20),
          ]),
        ]),
      ),
    );
  }

  /// 构建头像
  Widget _buildAvatar(ConversationModel conversation) {
    return stack.children([
      container.s50.circle.grey300.child(
        conversation.avatarUrl.isNotEmpty
            ? conversation.avatarUrl.image.s50.circle.cover.mk
            : Icons.person.icon.grey600.s24.mk,
      ),
      if (conversation.isOnline)
        positioned.r2.b2.child(
          container.s12.circle.green.border2.borderWhite.mk,
        ),
    ]);
  }

  /// 格式化时间显示
  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) {
      return '刚刚';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}分钟前';
    } else if (diff.inDays < 1) {
      return '${diff.inHours}小时前';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}天前';
    } else {
      return '${time.month}/${time.day}';
    }
  }

  /// 点击会话事件
  void _onConversationTap(
    ConversationModel conversation,
    ConversationController controller,
  ) {
    // 标记为已读
    controller.markAsRead(conversation.id);

    // 跳转到聊天页面
    Get.to(
      () => MessageListWidget(
        conversation: conversation,
      ),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  /// 显示会话菜单
  void _showConversationMenu(
    ConversationModel conversation,
    ConversationController controller,
  ) {
    Get.bottomSheet(
      container.white.roundedT20.p20.child(
        column.spacing16.children([
          container.w40.h4.grey300.rounded2.center.mk,
          '会话操作'.text.f18.bold.black.center.mk,
          _buildMenuButton(
            icon: Icons.push_pin_outlined,
            title: '置顶会话',
            onTap: () {
              Get.back();
              controller.pinConversation(conversation.id);
            },
          ),
          _buildMenuButton(
            icon: conversation.status == 'muted'
                ? Icons.volume_up
                : Icons.volume_off,
            title: conversation.status == 'muted' ? '取消免打扰' : '免打扰',
            onTap: () {
              Get.back();
              controller.toggleMute(conversation.id);
            },
          ),
          _buildMenuButton(
            icon: Icons.delete_outline,
            title: '删除会话',
            isDestructive: true,
            onTap: () {
              Get.back();
              _showDeleteConfirmDialog(conversation, controller);
            },
          ),
          GestureDetector(
            onTap: Get.back,
            child: '取消'.text.grey500.f16.center.mk,
          ),
        ]),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }

  /// 构建菜单按钮
  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: container.p16.rounded8.child(
        row.spacing16.children([
          icon.icon.s24.color(isDestructive ? Colors.red : Colors.grey[700]!).mk,
          title.text.f16.color(isDestructive ? Colors.red : Colors.black).mk,
        ]),
      ),
    );
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmDialog(
    ConversationModel conversation,
    ConversationController controller,
  ) {
    Get.dialog(
      AlertDialog(
        title: '删除会话'.text.f18.bold.mk,
        content: '确定要删除与 ${conversation.nickname} 的会话吗？此操作无法撤销。'.text.f14.mk,
        actions: [
          '取消'.textButton.grey500.click(
            onTap: Get.back,
          ),
          '删除'.textButton.red.click(
            onTap: () {
              Get.back();
              controller.deleteConversation(conversation.id);
            },
          ),
        ],
      ),
    );
  }
} 
