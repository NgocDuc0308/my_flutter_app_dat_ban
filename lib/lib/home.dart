import 'package:flutter/material.dart';
import 'package:app_dat_ban/lib/account.dart';
import 'package:app_dat_ban/lib/nearyou.dart';

// Trang giả lập cho "Tìm kiếm"
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tìm Kiếm')),
      body: const Center(child: Text('Đây là trang Tìm Kiếm')),
    );
  }
}

// Trang giả lập cho "Thêm"
class MorePage extends StatelessWidget {
  const MorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm')),
      body: const Center(child: Text('Đây là trang Thêm')),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Danh sách các trang tương ứng với BottomNavigationBar
  // Đã thêm các trang giả lập để khớp với 5 mục
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    NearYouPage(),
    SearchPage(),
    AccountPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // VẤN ĐỀ 1: Thêm 'body' để hiển thị nội dung trang được chọn
      body: _widgetOptions.elementAt(_selectedIndex),

      // Thanh điều hướng dưới cùng (BottomNavigationBar)
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6E0000), Color(0xFFFF2323)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Gần bạn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tìm kiếm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Tài khoản',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Thêm',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Thanh ứng dụng (AppBar)
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 24),
                const SizedBox(width: 4),
                const Text(
                  'TP. Hồ Chí Minh',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.red),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm nhà hàng, món ăn...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // Nội dung chính của trang
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Các chi nhánh nhà hàng'),
              const SizedBox(height: 16),
              _buildBranchList(),
              const SizedBox(height: 24),
              _buildSectionHeader('TOP các ưu đãi cực HOT'),
              const SizedBox(height: 16),
              _buildDealsList(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget xây dựng tiêu đề cho mỗi phần
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Xem tất cả',
          style: TextStyle(fontSize: 14, color: Colors.red[700]),
        ),
      ],
    );
  }

  // Widget xây dựng danh sách chi nhánh (cuộn ngang)
  Widget _buildBranchList() {
    // Dữ liệu giả
    final List<Map<String, String>> branches = [
      {
        'image': 'assets/imgChiNhanh/chinhanh1.png',
        'name': 'Chi nhánh 1',
        'address': 'Số 11 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh2.jpg',
        'name': 'Chi nhánh 2',
        'address': 'Số 23 Chế Lan Viên, P. Tây Thạnh, Q. Tân Phú',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh3.jpg',
        'name': 'Chi nhánh 3',
        'address': 'Số 62 Hoàng Văn Thụ, P. Đông Hưng Thuận, Q.3',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh4.png',
        'name': 'Chi nhánh 4',
        'address': 'Số 38 Lý Tự Trọng, P. Đông Hưng Thuận, Q.10',
      },
      {
        'image': 'assets/imgChiNhanh/chinhanh5.png',
        'name': 'Chi nhánh 5',
        'address': 'Số 42 Quang Trung, P. Đông Hưng Thuận, Q.Tân Phú',
      },
    ];

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return _buildBranchCard(
            branches[index]['image']!,
            branches[index]['name']!,
            branches[index]['address']!,
          );
        },
      ),
    );
  }

  // Widget cho một thẻ chi nhánh
  Widget _buildBranchCard(String imagePath, String name, String address) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              // Xử lý lỗi nếu không tìm thấy ảnh
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            address,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'Đặt bàn giữ chỗ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.red[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget xây dựng danh sách ưu đãi (dọc)
  Widget _buildDealsList() {
    // Dữ liệu giả
    final List<Map<String, String>> deals = [
      {
        'image': 'assets/imgUuDai/uudai1.jpg',
        'title': 'Combo ưu đãi 1',
        'expiry': '30/06/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai2.webp',
        'title': 'Combo ưu đãi 2',
        'expiry': '12/07/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai3.jpg',
        'title': 'Combo ưu đãi 3',
        'expiry': '29/09/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai4.jpg',
        'title': 'Combo ưu đãi 4',
        'expiry': '16/08/2025',
      },
      {
        'image': 'assets/imgUuDai/uudai5.jpg',
        'title': 'Combo ưu đãi 5',
        'expiry': '14/07/2025',
      },
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: deals.length,
      itemBuilder: (context, index) {
        return _buildDealCard(
          deals[index]['image']!,
          deals[index]['title']!,
          deals[index]['expiry']!,
        );
      },
    );
  }

  // Widget cho một thẻ ưu đãi
  Widget _buildDealCard(String imagePath, String title, String expiry) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Thời gian áp dụng: $expiry',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
