import 'package:flutter/material.dart';

class Accountinformation extends StatefulWidget {
  const Accountinformation({super.key});

  @override
  State<Accountinformation> createState() => _AccountinformationState();
}

class _AccountinformationState extends State<Accountinformation> {
  String name = "An";
  String job = "Nghề khác";
  String email = "vta@gmail.com";
  String gender = "Nam";
  String birthday = "13/11/2004";

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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  "Thông tin người dùng",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          // Nội dung thông tin người dùng
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
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
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(Icons.camera_alt, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      children: [
                        _buildInfoTile(
                          Icons.edit,
                          "Tên người dùng",
                          name,
                          editable: true,
                        ),
                        _buildInfoTile(
                          Icons.signal_cellular_alt,
                          "Tình trạng",
                          "Đang hoạt động",
                        ),
                        Container(height: 13, color: Colors.grey.shade300),
                        const SizedBox(height: 5),
                        _buildInfoTile(
                          Icons.phone,
                          "Số điện thoại",
                          "0123456789",
                        ),
                        _buildInfoTile(
                          Icons.work,
                          "Nghề nghiệp",
                          job,
                          editable: true,
                        ),
                        _buildInfoTile(
                          Icons.email,
                          "Email",
                          email,
                          editable: true,
                        ),
                        _buildInfoTile(
                          Icons.transgender,
                          "Giới tính",
                          gender,
                          editable: true,
                        ),
                        _buildInfoTile(
                          Icons.cake,
                          "Ngày sinh",
                          birthday,
                          editable: true,
                        ),
                        _buildInfoTile(
                          Icons.delete,
                          "Xóa tài khoản",
                          "",
                          hasArrow: true,
                        ),
                      ],
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

  Widget _buildInfoTile(
    IconData icon,
    String title,
    String value, {
    bool editable = false,
    bool hasArrow = false,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: Icon(icon),
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value.isNotEmpty)
                Text(
                  value,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              const SizedBox(width: 4),
              if (editable || hasArrow)
                const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
          onTap: () {},
        ),
        const Divider(height: 1),
      ],
    );
  }
}
