import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: _buildGradientIcon(Icons.wallet, selectedIndex == 0),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildGradientIcon(Icons.send, selectedIndex == 1),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildGradientIcon(Icons.analytics_rounded, selectedIndex == 2),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildGradientIcon(Icons.more_horiz, selectedIndex == 3),
          label: '',
        ),
      ],
    );
  }

  Widget _buildGradientIcon(IconData icon, bool isSelected) {
    if (isSelected) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color.fromARGB(255, 138, 39, 244),
              Color.fromARGB(255, 238, 127, 203),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(bounds);
        },
        child: Icon(
          icon,
          size: 28,
          color: Colors.white, // The gradient color will override this
        ),
      );
    } else {
      return Icon(
        icon,
        size: 28,
        color: const Color.fromARGB(255, 119, 119, 119), // Gray color for unselected icons
      );
    }
  }
}
