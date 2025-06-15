import 'package:flutter/material.dart';
import 'package:app_dat_ban/lib/account.dart';
import 'package:app_dat_ban/lib/nearyou.dart';
import 'package:app_dat_ban/lib/search.dart';
import 'package:app_dat_ban/lib/detailchinhanh.dart';

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
      body: _widgetOptions.elementAt(_selectedIndex),
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
  final List<Map<String, String>> branches = [
    {
      'image': 'assets/imgChiNhanh/chinhanh1.jpg',
      'name': 'Chi nhánh 1',
      'address': 'Số 11 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh2.jpg',
      'name': 'Chi nhánh 2',
      'address': 'Số 23 Chế Lan Viên, P. Tây Thạnh, Q. Tân Phú',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh3.png',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.red, size: 24),
                SizedBox(width: 4),
                Text(
                  'TP. Hồ Chí Minh',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.red),
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

  Widget _buildBranchList() {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: branches.length,
        itemBuilder: (context, index) {
          final branch = branches[index];
          return _buildBranchCard(
            branch['image']!,
            branch['name']!,
            branch['address']!,
          );
        },
      ),
    );
  }

  Widget _buildBranchCard(String imagePath, String name, String address) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChiNhanhPage(
              imagePath: imagePath,
              name: name,
              address: address,
            ),
          ),
        );
      },
      child: Container(
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
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              address,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
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
      ),
    );
  }

  Widget _buildDealsList() {
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
        final deal = deals[index];
        return _buildDealCard(deal['image']!, deal['title']!, deal['expiry']!);
      },
    );
  }

  Widget _buildDealCard(String imagePath, String title, String expiry) {
    return InkWell(
      onTap: () => debugPrint('Đã nhấn vào $title'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
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
      ),
    );
  }
}
