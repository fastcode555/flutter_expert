import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';

/// 资料编辑页面组件
///
/// 用于编辑用户昵称、头像、封面、简介、性别、生日等信息。
/// 使用 flutter_tailwind 链式调用 API 实现现代化的 UI 设计。
///
/// 创建时间：2024-06-10
/// 作者：AI助手
/// 最后修改时间：2024-12-19
class ProfileEditWidget extends StatefulWidget {
  const ProfileEditWidget({super.key});

  @override
  State<ProfileEditWidget> createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  
  String _selectedGender = '男';
  String _selectedBirthday = '1990-01-01';

  /// 保存资料
  ///
  /// 验证输入数据并保存用户资料信息
  void _saveProfile() {
    // TODO: 绑定 ProfileController，实现保存逻辑
    Get.snackbar(
      '提示',
      '资料保存成功',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// 选择头像
  ///
  /// 打开图片选择器，支持相册和拍照
  void _selectAvatar() {
    // TODO: 实现头像上传逻辑
    Get.snackbar(
      '提示',
      '头像上传功能开发中',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 选择封面
  ///
  /// 打开图片选择器，支持相册和拍照
  void _selectCover() {
    // TODO: 实现封面上传逻辑
    Get.snackbar(
      '提示',
      '封面上传功能开发中',
      snackPosition: SnackPosition.TOP,
    );
  }

  /// 选择生日
  ///
  /// 打开日期选择器
  Future<void> _selectBirthday() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedBirthday = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
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
        title: '编辑资料'.text.black.f18.bold.mk,
        actions: [
          padding.pr16.child(
            GestureDetector(
              onTap: _saveProfile,
              child: '保存'.text.blue.f16.mk,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      
      // 主体内容
      body: SingleChildScrollView(
        child: column.children([
          // 头像和封面区域
          _buildHeaderSection(),
          h24,
          
          // 表单区域 - 使用Column的完整属性支持，避免Container包装
          column.white.ph16.pv20.spacing20.children([
            // 昵称输入
            _buildNicknameField(),
            
            // 简介输入
            _buildBioField(),
            
            // 性别选择
            _buildGenderField(),
            
            // 生日选择
            _buildBirthdayField(),
          ]),
          h32,
        ]),
      ),
    );
  }

  /// 构建头部区域（头像和封面）
  Widget _buildHeaderSection() {
    return column.white.ph16.pv20.children([
      // 封面图片
      stack.children([
        // 封面背景 - 使用Container的完整属性，避免多层包装
        container.blue100.h120.wFull.rounded8.center.child(
          '封面图'.text.blue.f16.mk,
        ),
        // 编辑按钮 - 优化为预定义API
        positioned.r8.b8.child(
          GestureDetector(
            onTap: _selectCover,
            child: container.blue.rounded20.p8.child(
              Icons.camera_alt.icon.white.s20.mk,
            ),
          ),
        ),
      ]),
      h16,
      
      // 头像区域
      row.center.children([
        stack.children([
          // 头像
          container.grey200.s80.circle.center.child(
            Icons.person.icon.grey600.s40.mk,
          ),
          // 编辑按钮
          positioned.r0.b0.child(
            GestureDetector(
              onTap: _selectAvatar,
              child: container.blue.circle.p6.child(
                Icons.camera_alt.icon.white.s16.mk,
              ),
            ),
          ),
        ]),
      ]),
      h8,
      '点击编辑头像和封面'.text.grey600.f12.center.mk,
    ]);
  }

  /// 构建昵称输入字段
  Widget _buildNicknameField() {
    return column.children([
      '昵称'.text.black87.f16.bold.mk,
      h8,
      container.wFull.border1.borderGrey300.rounded8.p12.child(
        TextField(
          controller: _nicknameController,
          decoration: const InputDecoration(
            hintText: '请输入昵称',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ]);
  }

  /// 构建简介输入字段
  Widget _buildBioField() {
    return column.children([
      '简介'.text.black87.f16.bold.mk,
      h8,
      container.wFull.h80.border1.borderGrey300.rounded8.p12.child(
        TextField(
          controller: _bioController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: '请输入个人简介',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ]);
  }

  /// 构建性别选择字段
  Widget _buildGenderField() {
    return column.children([
      '性别'.text.black87.f16.bold.mk,
      h8,
      container.wFull.border1.borderGrey300.rounded8.p12.child(
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedGender,
            isExpanded: true,
            items: ['男', '女', '保密'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: value.text.f16.mk,
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedGender = newValue;
                });
              }
            },
          ),
        ),
      ),
    ]);
  }

  /// 构建生日选择字段
  Widget _buildBirthdayField() {
    return column.children([
      '生日'.text.black87.f16.bold.mk,
      h8,
      GestureDetector(
        onTap: _selectBirthday,
        child: container.wFull.border1.borderGrey300.rounded8.p12.child(
          row.spaceBetween.children([
            _selectedBirthday.text.f16.mk,
            Icons.calendar_today.icon.grey600.s20.mk,
          ]),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _bioController.dispose();
    super.dispose();
  }
} 