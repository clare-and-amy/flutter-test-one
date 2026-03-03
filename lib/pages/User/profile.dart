import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 248, 240),
      appBar: AppBar(
        title: const Text('个人中心'),
        backgroundColor: const Color(0xFFFF851B),
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: const Color(0xFFFF851B).withOpacity(0.3),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 用户信息区域
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 头像
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD7B3),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                        color: const Color(0xFFFF851B),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // 用户信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '用户名',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFF851B),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'user@example.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFFCC6B16),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF0E0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '普通会员',
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xFFFF851B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 功能菜单
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.shopping_cart,
                      title: '我的订单',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.favorite,
                      title: '我的收藏',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.location_on,
                      title: '收货地址',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.card_giftcard,
                      title: '优惠券',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 设置和其他选项
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.settings,
                      title: '设置',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.help,
                      title: '帮助与反馈',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.info,
                      title: '关于我们',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 退出登录按钮
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 退出登录逻辑
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('已退出登录'),
                        backgroundColor: Color(0xFFFF851B),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20),
                      ),
                    );
                    // 导航到登录页面
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFFF851B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFFFF851B), width: 2),
                    ),
                    elevation: 2,
                    shadowColor: const Color(0xFFFF851B).withOpacity(0.1),
                  ),
                  child: const Text(
                    '退出登录',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // 构建菜单项
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFFFF851B),
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: const Color(0xFF333333),
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: const Color(0xFFCCCCCC),
      ),
      onTap: onTap,
    );
  }

  // 构建分割线
  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFF0F0F0),
      indent: 72,
    );
  }
}
