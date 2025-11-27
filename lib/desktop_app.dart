import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'core/theme/tailwind_colors.dart';

void main() {
  runApp(const TRYB3DesktopApp());
}

class TRYB3DesktopApp extends StatelessWidget {
  const TRYB3DesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRYB3 Desktop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TailwindColors.orange500,
        colorScheme: ColorScheme.fromSeed(
          seedColor: TailwindColors.orange500,
          primary: TailwindColors.orange500,
          secondary: TailwindColors.cyan500,
          surface: TailwindColors.slate50,
          background: TailwindColors.slate100,
        ),
        useMaterial3: true,
        fontFamily: '-apple-system, BlinkMacSystemFont',
      ),
      home: const DesktopMainView(),
    );
  }
}

class DesktopMainView extends StatefulWidget {
  const DesktopMainView({super.key});

  @override
  State<DesktopMainView> createState() => _DesktopMainViewState();
}

class _DesktopMainViewState extends State<DesktopMainView> {
  int _selectedIndex = 0;
  bool _sidebarCollapsed = false;
  
  // Core Profile Data
  final UserProfile _userProfile = UserProfile(
    id: 'usr_001',
    name: 'Alex Thompson',
    username: '@alexthompson',
    email: 'alex@tryb3.com',
    avatarUrl: 'https://i.pravatar.cc/150?img=8',
    bio: 'Product Designer | Creative Thinker | Building the future at TRYB3',
    location: 'San Francisco, CA',
    website: 'alexthompson.design',
    joinedDate: DateTime(2024, 1, 15),
    followersCount: 1847,
    followingCount: 892,
    postsCount: 234,
    skills: ['UI/UX Design', 'Product Strategy', 'Flutter', 'Figma', 'Leadership'],
    badges: ['Early Adopter', 'Top Contributor', 'Mentor', 'Verified'],
    settings: ProfileSettings(
      theme: AppTheme.light,
      notifications: true,
      privacy: PrivacyLevel.public,
      language: 'en',
    ),
  );

  final List<NavigationItem> _navigationItems = [
    NavigationItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home', shortcut: '⌘1'),
    NavigationItem(icon: Icons.chat_bubble_outline, activeIcon: Icons.chat_bubble, label: 'Messages', shortcut: '⌘2', badge: '5'),
    NavigationItem(icon: Icons.people_outline, activeIcon: Icons.people, label: 'Network', shortcut: '⌘3'),
    NavigationItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Calendar', shortcut: '⌘4'),
    NavigationItem(icon: Icons.dashboard_outlined, activeIcon: Icons.dashboard, label: 'Dashboard', shortcut: '⌘5'),
    NavigationItem(icon: Icons.folder_outlined, activeIcon: Icons.folder, label: 'Projects', shortcut: '⌘6', badge: '2'),
    NavigationItem(icon: Icons.notifications_outlined, activeIcon: Icons.notifications, label: 'Notifications', shortcut: '⌘7', badge: '12'),
    NavigationItem(icon: Icons.settings_outlined, activeIcon: Icons.settings, label: 'Settings', shortcut: '⌘8'),
  ];

  @override
  void initState() {
    super.initState();
    _setupKeyboardShortcuts();
  }

  void _setupKeyboardShortcuts() {
    // Set up keyboard shortcuts for navigation
    RawKeyboard.instance.addListener((RawKeyEvent event) {
      if (event is RawKeyDownEvent) {
        if (event.isMetaPressed || event.isControlPressed) {
          final key = event.logicalKey;
          if (key == LogicalKeyboardKey.digit1) setState(() => _selectedIndex = 0);
          if (key == LogicalKeyboardKey.digit2) setState(() => _selectedIndex = 1);
          if (key == LogicalKeyboardKey.digit3) setState(() => _selectedIndex = 2);
          if (key == LogicalKeyboardKey.digit4) setState(() => _selectedIndex = 3);
          if (key == LogicalKeyboardKey.digit5) setState(() => _selectedIndex = 4);
          if (key == LogicalKeyboardKey.digit6) setState(() => _selectedIndex = 5);
          if (key == LogicalKeyboardKey.digit7) setState(() => _selectedIndex = 6);
          if (key == LogicalKeyboardKey.digit8) setState(() => _selectedIndex = 7);
          if (key == LogicalKeyboardKey.backslash) setState(() => _sidebarCollapsed = !_sidebarCollapsed);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TailwindColors.slate50,
      body: Row(
        children: [
          // Sidebar Navigation
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: _sidebarCollapsed ? 80 : 280,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: TailwindColors.slate200),
              ),
            ),
            child: Column(
              children: [
                // Logo/Brand Section
                Container(
                  height: 80,
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: TailwindColors.slate200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [TailwindColors.orange500, TailwindColors.orange600],
                          ),
                          borderRadius: BorderRadius.circular(TailwindRadius.xl),
                        ),
                        child: const Center(
                          child: Text(
                            'T3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      if (!_sidebarCollapsed) ...[
                        SizedBox(width: TailwindSpacing.s3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'TRYB3',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              'Desktop v2.0',
                              style: TextStyle(
                                fontSize: 12,
                                color: TailwindColors.slate500,
                              ),
                            ),
                          ],
                        ),
                      ],
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          _sidebarCollapsed ? Icons.menu : Icons.menu_open,
                          color: TailwindColors.slate600,
                        ),
                        onPressed: () {
                          setState(() {
                            _sidebarCollapsed = !_sidebarCollapsed;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                // User Profile Section
                if (!_sidebarCollapsed)
                  Container(
                    padding: EdgeInsets.all(TailwindSpacing.s4),
                    decoration: BoxDecoration(
                      color: TailwindColors.slate50,
                      border: Border(
                        bottom: BorderSide(color: TailwindColors.slate200),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(_userProfile.avatarUrl),
                        ),
                        SizedBox(width: TailwindSpacing.s3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userProfile.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                _userProfile.username,
                                style: TextStyle(
                                  color: TailwindColors.slate500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: TailwindColors.emerald500,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: EdgeInsets.all(TailwindSpacing.s4),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(_userProfile.avatarUrl),
                    ),
                  ),
                
                // Navigation Items
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(TailwindSpacing.s2),
                    itemCount: _navigationItems.length,
                    itemBuilder: (context, index) {
                      final item = _navigationItems[index];
                      final isSelected = _selectedIndex == index;
                      
                      return Container(
                        margin: EdgeInsets.only(bottom: TailwindSpacing.s1),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => setState(() => _selectedIndex = index),
                            borderRadius: BorderRadius.circular(TailwindRadius.lg),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: TailwindSpacing.s3,
                                vertical: TailwindSpacing.s2_5,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? TailwindColors.orange50 : Colors.transparent,
                                borderRadius: BorderRadius.circular(TailwindRadius.lg),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected ? item.activeIcon : item.icon,
                                    color: isSelected ? TailwindColors.orange600 : TailwindColors.slate600,
                                    size: 22,
                                  ),
                                  if (!_sidebarCollapsed) ...[
                                    SizedBox(width: TailwindSpacing.s3),
                                    Expanded(
                                      child: Text(
                                        item.label,
                                        style: TextStyle(
                                          color: isSelected ? TailwindColors.orange600 : TailwindColors.slate700,
                                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    if (item.badge != null)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: TailwindSpacing.s2,
                                          vertical: TailwindSpacing.s0_5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: TailwindColors.orange500,
                                          borderRadius: BorderRadius.circular(TailwindRadius.full),
                                        ),
                                        child: Text(
                                          item.badge!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    if (item.shortcut != null && !_sidebarCollapsed)
                                      Text(
                                        item.shortcut!,
                                        style: TextStyle(
                                          color: TailwindColors.slate400,
                                          fontSize: 11,
                                        ),
                                      ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // Footer Actions
                Container(
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: TailwindColors.slate200),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (!_sidebarCollapsed)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(TailwindSpacing.s3),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [TailwindColors.cyan500, TailwindColors.cyan600],
                            ),
                            borderRadius: BorderRadius.circular(TailwindRadius.lg),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Upgrade to Pro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: TailwindSpacing.s1),
                              const Text(
                                'Unlock all features',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content Area
          Expanded(
            child: _buildMainContent(),
          ),
          
          // Right Sidebar (Activity/Info Panel)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                left: BorderSide(color: TailwindColors.slate200),
              ),
            ),
            child: _buildRightSidebar(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: [
        // Top Bar
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(horizontal: TailwindSpacing.s6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: TailwindColors.slate200),
            ),
          ),
          child: Row(
            children: [
              Text(
                _navigationItems[_selectedIndex].label,
                style: TailwindTextStyles.text2xl.copyWith(
                  fontWeight: FontWeight.w700,
                  color: TailwindColors.slate900,
                ),
              ),
              const Spacer(),
              
              // Search Bar
              Container(
                width: 300,
                height: 36,
                decoration: BoxDecoration(
                  color: TailwindColors.slate100,
                  borderRadius: BorderRadius.circular(TailwindRadius.lg),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search... (⌘K)',
                    hintStyle: TextStyle(
                      color: TailwindColors.slate400,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: TailwindColors.slate400,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: TailwindSpacing.s2),
                  ),
                ),
              ),
              
              SizedBox(width: TailwindSpacing.s6),
              
              // Action Buttons
              IconButton(
                icon: Icon(Icons.add_circle, color: TailwindColors.orange500),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_none, color: TailwindColors.slate600),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.help_outline, color: TailwindColors.slate600),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        // Content Area
        Expanded(
          child: _getContentForIndex(_selectedIndex),
        ),
      ],
    );
  }

  Widget _buildRightSidebar() {
    return Column(
      children: [
        // Header
        Container(
          height: 64,
          padding: EdgeInsets.all(TailwindSpacing.s4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: TailwindColors.slate200),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Activity',
                style: TailwindTextStyles.textLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.more_horiz, color: TailwindColors.slate600),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        // Stats Cards
        Container(
          padding: EdgeInsets.all(TailwindSpacing.s4),
          child: Column(
            children: [
              _buildStatCard('Total Views', '12.5k', '+12%', TailwindColors.emerald500),
              SizedBox(height: TailwindSpacing.s3),
              _buildStatCard('Engagement', '3.2k', '+8%', TailwindColors.cyan500),
              SizedBox(height: TailwindSpacing.s3),
              _buildStatCard('New Followers', '247', '+23%', TailwindColors.orange500),
            ],
          ),
        ),
        
        // Recent Activity
        Expanded(
          child: Container(
            padding: EdgeInsets.all(TailwindSpacing.s4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activity',
                  style: TailwindTextStyles.textBase.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: TailwindSpacing.s4),
                Expanded(
                  child: ListView(
                    children: [
                      _buildActivityItem('Sarah liked your post', '2m ago', Icons.favorite, TailwindColors.rose500),
                      _buildActivityItem('Mike commented on your photo', '15m ago', Icons.comment, TailwindColors.cyan500),
                      _buildActivityItem('New follower: Alex Chen', '1h ago', Icons.person_add, TailwindColors.emerald500),
                      _buildActivityItem('Your post is trending!', '3h ago', Icons.trending_up, TailwindColors.orange500),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String change, Color color) {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s4),
      decoration: BoxDecoration(
        color: TailwindColors.slate50,
        borderRadius: BorderRadius.circular(TailwindRadius.lg),
        border: Border.all(color: TailwindColors.slate200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: TailwindColors.slate600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: TailwindSpacing.s1),
                Text(
                  value,
                  style: TailwindTextStyles.textXl.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: TailwindSpacing.s2,
              vertical: TailwindSpacing.s1,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(TailwindRadius.md),
            ),
            child: Text(
              change,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: TailwindSpacing.s3),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(TailwindRadius.lg),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          SizedBox(width: TailwindSpacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: TailwindColors.slate500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContentForIndex(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildMessagesContent();
      case 2:
        return _buildNetworkContent();
      case 3:
        return _buildCalendarContent();
      case 4:
        return _buildDashboardContent();
      default:
        return Center(
          child: Text(
            '${_navigationItems[index].label} Content',
            style: TailwindTextStyles.text2xl,
          ),
        );
    }
  }

  Widget _buildHomeContent() {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Container(
            padding: EdgeInsets.all(TailwindSpacing.s6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [TailwindColors.orange500, TailwindColors.orange600],
              ),
              borderRadius: BorderRadius.circular(TailwindRadius.xl2),
              boxShadow: TailwindShadows.shadowLg,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, ${_userProfile.name.split(' ')[0]}!',
                        style: TailwindTextStyles.text3xl.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: TailwindSpacing.s2),
                      Text(
                        'You have 5 new messages and 12 notifications',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: TailwindSpacing.s6),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: TailwindColors.orange500,
                          padding: EdgeInsets.symmetric(
                            horizontal: TailwindSpacing.s6,
                            vertical: TailwindSpacing.s3,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(TailwindRadius.lg),
                          ),
                        ),
                        child: const Text('View Activity'),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.rocket_launch,
                  size: 80,
                  color: Colors.white.withOpacity(0.3),
                ),
              ],
            ),
          ),
          
          SizedBox(height: TailwindSpacing.s8),
          
          // Quick Actions
          Text(
            'Quick Actions',
            style: TailwindTextStyles.textXl.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: TailwindSpacing.s4),
          
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: TailwindSpacing.s4,
            crossAxisSpacing: TailwindSpacing.s4,
            childAspectRatio: 1.5,
            children: [
              _buildQuickAction(Icons.edit, 'New Post', TailwindColors.cyan500),
              _buildQuickAction(Icons.calendar_month, 'Schedule', TailwindColors.emerald500),
              _buildQuickAction(Icons.people, 'Invite', TailwindColors.orange500),
              _buildQuickAction(Icons.analytics, 'Analytics', TailwindColors.rose500),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TailwindRadius.xl),
        border: Border.all(color: TailwindColors.slate200),
        boxShadow: TailwindShadows.shadowSm,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(TailwindRadius.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              SizedBox(height: TailwindSpacing.s2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesContent() {
    return Container(
      child: Row(
        children: [
          // Chat List
          Container(
            width: 320,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: TailwindColors.slate200),
              ),
            ),
            child: Column(
              children: [
                // Search
                Container(
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search messages...',
                      prefixIcon: Icon(Icons.search, color: TailwindColors.slate400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(TailwindRadius.lg),
                        borderSide: BorderSide(color: TailwindColors.slate300),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: TailwindSpacing.s2),
                    ),
                  ),
                ),
                // Chat items
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(TailwindSpacing.s4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: TailwindColors.slate100),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
                            ),
                            SizedBox(width: TailwindSpacing.s3),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User ${index + 1}',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Last message preview here...',
                                    style: TextStyle(
                                      color: TailwindColors.slate500,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${Random().nextInt(59)}m',
                                  style: TextStyle(
                                    color: TailwindColors.slate400,
                                    fontSize: 12,
                                  ),
                                ),
                                if (Random().nextBool())
                                  Container(
                                    margin: EdgeInsets.only(top: TailwindSpacing.s1),
                                    padding: EdgeInsets.all(TailwindSpacing.s1),
                                    decoration: BoxDecoration(
                                      color: TailwindColors.orange500,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${Random().nextInt(9) + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // Chat Area
          Expanded(
            child: Column(
              children: [
                // Chat Header
                Container(
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: TailwindColors.slate200),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=1'),
                      ),
                      SizedBox(width: TailwindSpacing.s3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sarah Wilson',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Active now',
                            style: TextStyle(
                              color: TailwindColors.emerald500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.videocam, color: TailwindColors.slate600),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.call, color: TailwindColors.slate600),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: TailwindColors.slate600),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                // Messages
                Expanded(
                  child: Container(
                    color: TailwindColors.slate50,
                    child: const Center(
                      child: Text('Chat messages will appear here'),
                    ),
                  ),
                ),
                
                // Input
                Container(
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: TailwindColors.slate200),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.attach_file, color: TailwindColors.slate600),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(TailwindRadius.lg),
                              borderSide: BorderSide(color: TailwindColors.slate300),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: TailwindSpacing.s4,
                              vertical: TailwindSpacing.s2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: TailwindSpacing.s2),
                      IconButton(
                        icon: Icon(Icons.mic, color: TailwindColors.slate600),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: TailwindColors.orange500),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkContent() {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Network Stats
          Row(
            children: [
              _buildNetworkStat('Connections', '${_userProfile.followersCount}', TailwindColors.cyan500),
              SizedBox(width: TailwindSpacing.s4),
              _buildNetworkStat('Following', '${_userProfile.followingCount}', TailwindColors.emerald500),
              SizedBox(width: TailwindSpacing.s4),
              _buildNetworkStat('Pending', '23', TailwindColors.orange500),
            ],
          ),
          
          SizedBox(height: TailwindSpacing.s6),
          
          // People Grid
          Text(
            'People You May Know',
            style: TailwindTextStyles.textXl.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: TailwindSpacing.s4),
          
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(TailwindSpacing.s4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(TailwindRadius.xl),
                    border: Border.all(color: TailwindColors.slate200),
                    boxShadow: TailwindShadows.shadowSm,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 10}'),
                      ),
                      SizedBox(height: TailwindSpacing.s3),
                      Text(
                        'User ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${Random().nextInt(500)} connections',
                        style: TextStyle(
                          color: TailwindColors.slate500,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: TailwindSpacing.s3),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TailwindColors.orange500,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(TailwindRadius.md),
                          ),
                        ),
                        child: const Text('Connect', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkStat(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(TailwindSpacing.s4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(TailwindRadius.xl),
          border: Border.all(color: TailwindColors.slate200),
        ),
        child: Column(
          children: [
            Icon(Icons.people, color: color, size: 32),
            SizedBox(height: TailwindSpacing.s2),
            Text(
              value,
              style: TailwindTextStyles.text2xl.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: TailwindColors.slate500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarContent() {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s6),
      child: Column(
        children: [
          // Calendar Header
          Row(
            children: [
              Text(
                'November 2024',
                style: TailwindTextStyles.text2xl.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.chevron_left, color: TailwindColors.slate600),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: TailwindColors.slate600),
                onPressed: () {},
              ),
              SizedBox(width: TailwindSpacing.s4),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('New Event'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TailwindColors.orange500,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          
          SizedBox(height: TailwindSpacing.s6),
          
          // Calendar Grid
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(TailwindRadius.xl),
                border: Border.all(color: TailwindColors.slate200),
              ),
              child: const Center(
                child: Text('Calendar widget would go here'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardContent() {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s6),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: TailwindSpacing.s6,
        crossAxisSpacing: TailwindSpacing.s6,
        childAspectRatio: 1.5,
        children: [
          _buildDashboardCard('Revenue', '\$12,543', '+23%', Icons.trending_up, TailwindColors.emerald500),
          _buildDashboardCard('Users', '1,234', '+12%', Icons.people, TailwindColors.cyan500),
          _buildDashboardCard('Orders', '456', '+8%', Icons.shopping_cart, TailwindColors.orange500),
          _buildDashboardCard('Engagement', '89%', '+5%', Icons.insights, TailwindColors.rose500),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, String value, String change, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(TailwindSpacing.s6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(TailwindRadius.xl2),
        border: Border.all(color: TailwindColors.slate200),
        boxShadow: TailwindShadows.shadowMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(TailwindSpacing.s3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(TailwindRadius.lg),
                ),
                child: Icon(icon, color: color),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: TailwindSpacing.s2,
                  vertical: TailwindSpacing.s1,
                ),
                decoration: BoxDecoration(
                  color: TailwindColors.emerald50,
                  borderRadius: BorderRadius.circular(TailwindRadius.md),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    color: TailwindColors.emerald600,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: TailwindTextStyles.text3xl.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: TailwindColors.slate500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Core Models
class UserProfile {
  final String id;
  final String name;
  final String username;
  final String email;
  final String avatarUrl;
  final String bio;
  final String location;
  final String website;
  final DateTime joinedDate;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final List<String> skills;
  final List<String> badges;
  final ProfileSettings settings;

  UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.avatarUrl,
    required this.bio,
    required this.location,
    required this.website,
    required this.joinedDate,
    required this.followersCount,
    required this.followingCount,
    required this.postsCount,
    required this.skills,
    required this.badges,
    required this.settings,
  });
}

class ProfileSettings {
  final AppTheme theme;
  final bool notifications;
  final PrivacyLevel privacy;
  final String language;

  ProfileSettings({
    required this.theme,
    required this.notifications,
    required this.privacy,
    required this.language,
  });
}

class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String? shortcut;
  final String? badge;

  NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.shortcut,
    this.badge,
  });
}

enum AppTheme { light, dark, auto }
enum PrivacyLevel { public, friends, private }