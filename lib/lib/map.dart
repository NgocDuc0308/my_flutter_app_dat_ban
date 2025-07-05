import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:math';
import 'detailchinhanh.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allBranches = [
    {
      'image': 'assets/imgChiNhanh/chinhanh1.jpg',
      'name': 'Chi nhánh Bến Thành',
      'address': '121 Lê Thánh Tôn, P. Bến Thành, Q.1, TP.HCM',
      'latLng': LatLng(10.770109, 106.699660),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh2.jpg',
      'name': 'Chi nhánh Phú Nhuận',
      'address': '124 Phan Xích Long, P.2, Q. Phú Nhuận, TP.HCM',
      'latLng': LatLng(10.803200, 106.680700),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh3.png',
      'name': 'Chi nhánh Tân Phú',
      'address': '245 Tân Sơn Nhì, P. Tân Sơn Nhì, Q. Tân Phú, TP.HCM',
      'latLng': LatLng(10.814300, 106.626800),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh4.png',
      'name': 'Chi nhánh Thủ Đức',
      'address': '56 Võ Văn Ngân, P. Linh Chiểu, TP. Thủ Đức, TP.HCM',
      'latLng': LatLng(10.854000, 106.768800),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh5.png',
      'name': 'Chi nhánh Gò Vấp',
      'address': '450 Quang Trung, P.10, Q. Gò Vấp, TP.HCM',
      'latLng': LatLng(10.840200, 106.672500),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh6.jpg',
      'name': 'Chi nhánh Tân Bình',
      'address': '62 Trường Chinh, P.12, Q. Tân Bình, TP.HCM',
      'latLng': LatLng(10.797600, 106.639800),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh7.jpg',
      'name': 'Chi nhánh Bình Thạnh',
      'address': '234 Xô Viết Nghệ Tĩnh, P.21, Q. Bình Thạnh, TP.HCM',
      'latLng': LatLng(10.807200, 106.707500),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh8.jpg',
      'name': 'Chi nhánh Quận 3',
      'address': '8 Nguyễn Thị Minh Khai, P. Đa Kao, Q.3, TP.HCM',
      'latLng': LatLng(10.774900, 106.688300),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh9.jpg',
      'name': 'Chi nhánh Quận 10',
      'address': '285 Cách Mạng Tháng 8, P.12, Q.10, TP.HCM',
      'latLng': LatLng(10.761000, 106.659000),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh10.jpg',
      'name': 'Chi nhánh Quận 7',
      'address': '100 Nguyễn Văn Linh, P. Tân Phong, Q.7, TP.HCM',
      'latLng': LatLng(10.742900, 106.712200),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh11.jpg',
      'name': 'Chi nhánh Hà Đông',
      'address': '102 Trần Phú, Q. Hà Đông, Hà Nội',
      'latLng': LatLng(20.963700, 105.781900),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh12.jpg',
      'name': 'Chi nhánh Cầu Giấy',
      'address': '165 Cầu Giấy, Q. Cầu Giấy, Hà Nội',
      'latLng': LatLng(21.024500, 105.801300),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh13.webp',
      'name': 'Chi nhánh Hoàn Kiếm',
      'address': '2 Hàng Bài, Q. Hoàn Kiếm, Hà Nội',
      'latLng': LatLng(21.028000, 105.852800),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh14.webp',
      'name': 'Chi nhánh Thanh Xuân',
      'address': '1 Nguyễn Trãi, Q. Thanh Xuân, Hà Nội',
      'latLng': LatLng(21.002600, 105.809600),
    },
    {
      'image': 'assets/imgChiNhanh/chinhanh15.jpg',
      'name': 'Chi nhánh Long Biên',
      'address': '50 Nguyễn Văn Cừ, Q. Long Biên, Hà Nội',
      'latLng': LatLng(21.039600, 105.856800),
    },
  ];

  List<Map<String, dynamic>> branches = [];
  final LatLng _defaultCenter = const LatLng(10.834254, 106.666567);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    branches = List.from(allBranches);
    _loadMarkers();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _defaultCenter, zoom: 14),
        ),
      );
    });
  }

  void _loadMarkers() {
    final loadedMarkers = branches.asMap().entries.map((entry) {
      final index = entry.key;
      final branch = entry.value;
      return Marker(
        markerId: MarkerId("branch_$index"),
        position: branch['latLng'],
        infoWindow: InfoWindow(title: branch['name']),
      );
    }).toSet();

    setState(() {
      _markers = loadedMarkers;
    });
  }

  double _deg2rad(double deg) => deg * (pi / 180);

  double _calculateDistance(LatLng start, LatLng end) {
    const earthRadius = 6371;
    final dLat = _deg2rad(end.latitude - start.latitude);
    final dLng = _deg2rad(end.longitude - start.longitude);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(start.latitude)) *
            cos(_deg2rad(end.latitude)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  Future<void> _searchBranch(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Không tìm thấy vị trí")));
        return;
      }

      final searchLatLng = LatLng(
        locations[0].latitude,
        locations[0].longitude,
      );

      final nearbyBranches = allBranches.where((branch) {
        final branchLatLng = branch['latLng'] as LatLng;
        final distance = _calculateDistance(searchLatLng, branchLatLng);
        return distance <= 5.0;
      }).toList();

      if (nearbyBranches.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Không có chi nhánh nào gần đây")),
        );
        return;
      }

      setState(() {
        branches = nearbyBranches;
        _loadMarkers();
      });

      _mapController.animateCamera(
        CameraUpdate.newLatLngZoom(searchLatLng, 13),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Lỗi khi tìm địa chỉ")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.48,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _defaultCenter,
                    zoom: 14,
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "Các chi nhánh gần đó",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: branches.length,
                        itemBuilder: (context, index) {
                          final branch = branches[index];
                          return GestureDetector(
                            onTap: () {
                              _mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: branch['latLng'],
                                    zoom: 15,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 110,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      branch['image'],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stack) =>
                                          const Icon(Icons.image),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    branch['name'],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(branch['address']),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailChiNhanhPage(
                                                          imagePath:
                                                              branch['image'],
                                                          name: branch['name'],
                                                          address:
                                                              branch['address'],
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Đặt bàn",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        if (value.trim().isEmpty) {
                          setState(() {
                            branches = List.from(allBranches);
                            _loadMarkers();
                          });
                          _mapController.animateCamera(
                            CameraUpdate.newLatLngZoom(_defaultCenter, 14),
                          );
                        } else {
                          _searchBranch(value.trim());
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Nhập địa chỉ của bạn...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.red),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
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
}
