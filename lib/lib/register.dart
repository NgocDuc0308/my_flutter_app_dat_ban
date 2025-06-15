import 'package:app_dat_ban/lib/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Lớp 1: Nền màu đỏ ở phía sau
          _buildRedBackground(screenHeight),

          // Lớp 2: Form đăng ký màu trắng
          SingleChildScrollView(
            child: Column(
              children: [
                // Khoảng trống trong suốt ở trên cùng để đẩy form xuống
                SizedBox(height: screenHeight * 0.18),

                // Container chứa toàn bộ form trắng
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo
                        _buildLogo(),
                        const SizedBox(height: 30),

                        // Form fields
                        _buildTextField(label: 'Họ tên', hint: 'Họ tên'),
                        const SizedBox(height: 20),
                        _buildTextField(
                          label: 'Email',
                          hint: 'abc@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          label: 'Mật khẩu',
                          hint: '********',
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          label: 'Xác nhận mật khẩu',
                          hint: '********',
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),

                        // Nút Đăng ký
                        _buildRegisterButton(),
                        const SizedBox(height: 30),

                        // Link Đăng nhập
                        _buildLoginLink(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget xây dựng nền đỏ phía trên
  Widget _buildRedBackground(double screenHeight) {
    return Container(
      height: screenHeight * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB71C1C), // Màu đỏ đậm
            Color(0xFFE53935), // Màu đỏ tươi
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  /// Widget xây dựng logo
  Widget _buildLogo() {
    return const Column(
      children: [
        // Đây là phần logo, bạn có thể thay bằng Image.asset nếu có file ảnh
        Text(
          'SeatMe',
          style: TextStyle(
            color: Color(0xFFE53935),
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
        Text(
          'ĐẶT BÀN ONLINE',
          style: TextStyle(
            color: Color(0xFFE53935),
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  /// Widget tái sử dụng để tạo các trường nhập liệu
  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFE53935),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            // Sử dụng UnderlineInputBorder để chỉ có gạch chân
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE53935)),
            ),
            // Xóa bỏ khoảng trống mặc định để field gần với label hơn
            contentPadding: const EdgeInsets.only(top: 10, bottom: 5),
          ),
        ),
      ],
    );
  }

  /// Widget xây dựng nút Đăng ký
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        // TODO: Thêm logic đăng ký
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB71C1C), Color(0xFFE53935)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: const Text(
            'Đăng ký',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  /// Widget xây dựng link chuyển sang trang Đăng nhập
  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Bạn đã có mật khẩu ", style: TextStyle(color: Colors.grey)),
        GestureDetector(
          onTap: () {
            // TODO: Thêm logic điều hướng về trang đăng nhập
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: const Text(
            'Đăng nhập',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
