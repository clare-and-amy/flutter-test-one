import 'package:flutter/material.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // 启动页图片列表
  final List<String> _images = [
    'lib/assets/ad/ad1.png',
    'lib/assets/ad/ad2.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 页面视图
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              print(_images[index]);
              return Stack(
                fit: StackFit.expand,
                children: [
                  // 图片平铺整个页面
                  Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // 页面指示器 - 放在底部
                  if (index < _images.length - 1)
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: _buildPageIndicator(),
                    ),
                  // 进入按钮 - 放在底部
                  if (index == _images.length - 1)
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: _buildEnterButton(),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // 构建页面指示器
  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _images.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: _currentPage == index ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: _currentPage == index
                  ? const Color(0xFFFF851B)
                  : const Color(0xFFFFD7B3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  // 构建进入按钮
  Widget _buildEnterButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: () {
            // 导航到首页
            Navigator.pushNamed(context, '/');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF851B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
            elevation: 4,
            shadowColor: const Color(0xFFFF851B).withOpacity(0.3),
          ),
          child: const Text(
            '进入首页',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
