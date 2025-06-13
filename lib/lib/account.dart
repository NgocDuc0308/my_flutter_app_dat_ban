import 'package:app_dat_ban/lib/login.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header: Đăng nhập
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6E0000), Color(0xFFFF2323)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Đăng nhập để cải thiện trải nghiệm',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 110,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Đăng nhập / Đăng ký',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Danh sách mục
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(Icons.person_outline, 'Thông tin tài khoản'),
                _buildMenuItem(Icons.history, 'Lịch sử giao dịch'),
                _buildMenuItem(Icons.favorite_border, 'Yêu thích'),
                _buildMenuItem(Icons.chat_bubble_outline, 'Trò chuyện với ...'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: xử lý khi nhấn vào từng mục
      },
    );
  }
}
