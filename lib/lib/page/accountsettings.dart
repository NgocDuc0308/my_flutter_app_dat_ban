import 'package:flutter/material.dart';
import 'package:app_dat_ban/lib/page/accountinformation.dart';
import 'package:app_dat_ban/lib/page/changepassword.dart';
import 'package:app_dat_ban/lib/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_logged_in');
    await prefs.remove('current_email');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 16),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6E0000), Color(0xFFFF2323)],
              ),
            ),
            child: const Center(
              child: Text(
                'Tài khoản',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Accountinformation(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 46,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'User Name',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '0123456789',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),

                  _buildInfoTile(Icons.person, "ID Khách hàng", "ID1234"),
                  _buildInfoTile(Icons.wifi, "Trạng thái", "Đang hoạt động"),

                  _buildNavTile(
                    icon: Icons.password,
                    title: "Thay đổi mật khẩu",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Changepassword(),
                        ),
                      );
                    },
                  ),

                  _buildNavTile(
                    icon: Icons.menu_book_outlined,
                    title: "Lịch sử đơn đặt chỗ",
                    onTap: () {},
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Trải nghiệm",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  _buildNavTile(
                    icon: Icons.favorite_border,
                    title: "Yêu thích",
                    onTap: () {},
                  ),
                  _buildNavTile(
                    icon: Icons.access_time,
                    title: "Hoạt động gần đây",
                    onTap: () {},
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cài đặt",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  _buildNavTile(
                    icon: Icons.chat_bubble_outline,
                    title: "Chat",
                    onTap: () {},
                  ),
                  _buildNavTile(
                    icon: Icons.person_add,
                    title: "Mời bạn bè",
                    onTap: () {},
                  ),

                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _logout(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: Text(
            value,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildNavTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
