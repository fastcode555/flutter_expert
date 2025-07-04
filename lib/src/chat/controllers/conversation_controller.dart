import 'package:flutter_expert/src/chat/models/conversation_model.dart';
import 'package:get/get.dart';

/// 会话控制器
///
/// 负责管理会话列表、搜索会话、标记已读等业务逻辑。
/// 用于演示目的，使用模拟数据。
///
/// 创建时间：2024-12-19
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ConversationController extends GetxController {
  /// 会话列表
  RxList<ConversationModel> conversationList = <ConversationModel>[].obs;
  
  /// 搜索关键词
  RxString searchKeyword = ''.obs;
  
  /// 是否正在加载
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initMockData();
  }

  /// 初始化模拟数据
  ///
  /// 创建一些演示用的会话数据
  void _initMockData() {
    final mockConversations = [
      ConversationModel(
        id: '1',
        userId: 'user_001',
        nickname: '张小明',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '好的，没问题！',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
        status: 'normal',
      ),
      ConversationModel(
        id: '2',
        userId: 'user_002',
        nickname: '李华',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '今天天气不错，一起出去走走吧！',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: true,
        status: 'normal',
      ),
      ConversationModel(
        id: '3',
        userId: 'user_003',
        nickname: '王美丽',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '[图片]',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
        unreadCount: 1,
        isOnline: false,
        status: 'normal',
      ),
      ConversationModel(
        id: '4',
        userId: 'user_004',
        nickname: '陈大力',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '收到，谢谢！',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
        unreadCount: 0,
        isOnline: false,
        status: 'normal',
      ),
      ConversationModel(
        id: '5',
        userId: 'user_005',
        nickname: '赵敏',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '明天见！',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: true,
        status: 'normal',
      ),
      ConversationModel(
        id: '6',
        userId: 'user_006',
        nickname: '孙悟空',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '哈哈哈，太有趣了！',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 2)),
        unreadCount: 5,
        isOnline: false,
        status: 'normal',
      ),
      ConversationModel(
        id: '7',
        userId: 'user_007',
        nickname: '林黛玉',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '嗯嗯，我知道了。',
        lastMessageTime: DateTime.now().subtract(const Duration(days: 3)),
        unreadCount: 0,
        isOnline: false,
        status: 'normal',
      ),
      ConversationModel(
        id: '8',
        userId: 'user_008',
        nickname: '工作群',
        avatarUrl: 'https://via.placeholder.com/150',
        lastMessage: '今日会议延期到下午3点',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 4)),
        unreadCount: 12,
        isOnline: true,
        status: 'normal',
      ),
    ];

    conversationList.assignAll(mockConversations);
  }

  /// 获取过滤后的会话列表
  ///
  /// 根据搜索关键词过滤会话
  List<ConversationModel> get filteredConversations {
    if (searchKeyword.value.isEmpty) {
      return conversationList;
    }
    
    return conversationList.where((conversation) {
      return conversation.nickname.toLowerCase().contains(searchKeyword.value.toLowerCase()) ||
             conversation.lastMessage.toLowerCase().contains(searchKeyword.value.toLowerCase());
    }).toList();
  }

  /// 搜索会话
  ///
  /// [keyword] 搜索关键词
  void searchConversations(String keyword) {
    searchKeyword.value = keyword;
  }

  /// 清除搜索
  void clearSearch() {
    searchKeyword.value = '';
  }

  /// 标记会话为已读
  ///
  /// [conversationId] 会话ID
  void markAsRead(String conversationId) {
    final index = conversationList.indexWhere((c) => c.id == conversationId);
    if (index != -1) {
      final conversation = conversationList[index];
      conversationList[index] = conversation.copyWith(unreadCount: 0);
    }
  }

  /// 删除会话
  ///
  /// [conversationId] 会话ID
  void deleteConversation(String conversationId) {
    conversationList.removeWhere((c) => c.id == conversationId);
    Get.snackbar(
      '提示',
      '会话已删除',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// 置顶会话
  ///
  /// [conversationId] 会话ID
  void pinConversation(String conversationId) {
    final index = conversationList.indexWhere((c) => c.id == conversationId);
    if (index != -1) {
      final conversation = conversationList.removeAt(index);
      conversationList.insert(0, conversation);
      Get.snackbar(
        '提示',
        '会话已置顶',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// 免打扰设置
  ///
  /// [conversationId] 会话ID
  void toggleMute(String conversationId) {
    final index = conversationList.indexWhere((c) => c.id == conversationId);
    if (index != -1) {
      final conversation = conversationList[index];
      final newStatus = conversation.status == 'muted' ? 'normal' : 'muted';
      conversationList[index] = conversation.copyWith(status: newStatus);
      
      Get.snackbar(
        '提示',
        newStatus == 'muted' ? '已开启免打扰' : '已关闭免打扰',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// 刷新会话列表
  Future<void> refreshConversations() async {
    isLoading.value = true;
    
    // 模拟网络请求延时
    await Future.delayed(const Duration(seconds: 1));
    
    // 重新初始化数据（实际应用中这里会调用API）
    _initMockData();
    
    isLoading.value = false;
    
    Get.snackbar(
      '提示',
      '会话列表已刷新',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }
} 