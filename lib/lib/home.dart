import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_dat_ban/lib/account.dart';
import 'package:app_dat_ban/lib/page/accountsettings.dart';
import 'package:app_dat_ban/lib/nearyou.dart';
import 'package:app_dat_ban/lib/search.dart';
import 'package:app_dat_ban/lib/more.dart';
import 'package:app_dat_ban/lib/detailchinhanh.dart';
import 'package:app_dat_ban/lib/detail/allchinhanh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('is_logged_in') ?? false;

    setState(() {
      _widgetOptions = <Widget>[
        const HomeContent(),
        const NearYouPage(),
        const SearchPage(),
        loggedIn ? const Account() : const AccountPage(),
        const MorePage(),
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_widgetOptions.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

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
      'name': 'Chi nhánh Bến Thành',
      'address': '121 Lê Thánh Tôn, P. Bến Thành, Q.1, TP.HCM',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh2.jpg',
      'name': 'Chi nhánh Phú Nhuận',
      'address': '124 Phan Xích Long, P.2, Q. Phú Nhuận, TP.HCM',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh3.png',
      'name': 'Chi nhánh Tân Phú',
      'address': '245 Tân Sơn Nhì, P. Tân Sơn Nhì, Q. Tân Phú, TP.HCM',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh4.png',
      'name': 'Chi nhánh Thủ Đức',
      'address': '56 Võ Văn Ngân, P. Linh Chiểu, TP. Thủ Đức, TP.HCM',
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh5.png',
      'name': 'Chi nhánh Gò Vấp',
      'address': '450 Quang Trung, P.10, Q. Gò Vấp, TP.HCM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
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
              _buildSectionHeader('TOP chi nhánh nhà hàng'),
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
        GestureDetector(
          onTap: () {
            if (title == 'TOP chi nhánh nhà hàng') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllChiNhanhPage(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chức năng đang phát triển')),
              );
            }
          },
          child: Text(
            'Xem tất cả',
            style: TextStyle(fontSize: 14, color: Colors.red[700]),
          ),
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
