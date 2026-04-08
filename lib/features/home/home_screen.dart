import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track selected reciter index
  int? _selectedReciterIndex;

  final List<String> _reciters = [
    'Abdelaziz sheim',
    'Abdelbari Al- Toubayti',
    'Abdelaziz sheim',
    'Abdul Aziz Al-Ahmad',
    'Mishary Rashid Alafasy',
    'Saad El Ghamidi',
    'Abdul Rahman Al-Sudais',
    'Maher Al-Muaiqly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed section (Non-scrollable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Header
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF007BFF),
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/Logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Urdu Quran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search Reciter',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        prefixIcon: Icon(Icons.search, color: Colors.grey, size: 28),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Continue Listening
                  const Text(
                    'Continue Listening',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          '1. Al-Baqarah',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        const Icon(Icons.download_outlined, color: Colors.grey, size: 28),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Color(0xFF007BFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Pick a Reciter (Fixed header for scrollable list)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pick a Reciters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Color(0xFF007BFF), fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Scrollable List Section
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 100), // Extra bottom padding for floating nav
                itemCount: _reciters.length,
                itemBuilder: (context, index) {
                  return _buildReciterCard(_reciters[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReciterCard(String name, int index) {
    bool isSelected = _selectedReciterIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReciterIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF007BFF) : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
