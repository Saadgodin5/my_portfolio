import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ═══════════════════════════════════════════════════════════════════════════
// SadFlow — Comfortable, Soft Design
// ═══════════════════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════════════════════════════════
// Your links — replace with your actual usernames
// ═══════════════════════════════════════════════════════════════════════════
const String _githubUsername = 'Saadgodin5';

const Color _bgDark = Color(0xFF0F1419);
const Color _accentSoft = Color(0xFF5DADE2);
const Color _accentWarm = Color(0xFF85C1E9);
const Color _textFaded = Color(0xFF94A3B8);
const Color _cardBg = Color(0xFF1E293B);
const Color _cardBorder = Color(0xFF334155);

// ═══════════════════════════════════════════════════════════════════════════
// Data — Customize these
// ═══════════════════════════════════════════════════════════════════════════

final List<Map<String, dynamic>> projectsData = [
  {
    'title': 'Magalo App',
    'description':
        'Flutter app with user-friendly design, smooth navigation and interactive features. Cross-platform.',
    'tech': ['Flutter', 'Dart'],
    'github': 'https://github.com/Saadgodin5/magalo_app',
    'live': null,
    'thumbnail': null,
  },
  {
    'title': 'Flutter Course',
    'description': 'Flutter learning projects and course materials.',
    'tech': ['Flutter', 'Dart'],
    'github': 'https://github.com/Saadgodin5/flutter_course',
    'live': null,
    'thumbnail': null,
  },
  {
    'title': 'Machine Learning',
    'description': 'Machine learning projects and experiments.',
    'tech': ['Python', 'ML'],
    'github': 'https://github.com/Saadgodin5/machine_learning-',
    'live': null,
    'thumbnail': null,
  },
  {
    'title': 'Website JSL',
    'description': 'Web project with modern design.',
    'tech': ['Web', 'HTML', 'CSS'],
    'github': 'https://github.com/Saadgodin5/webside_jsl',
    'live': null,
    'thumbnail': null,
  },
  {
    'title': 'Ankara Community Website',
    'description': 'Website for the community of Ankara.',
    'tech': ['CSS', 'Web'],
    'github': 'https://github.com/Saadgodin5/webside_jsl_',
    'live': null,
    'thumbnail': null,
  },
  {
    'title': 'Graduation Website',
    'description': 'Graduation project — Flutter web application.',
    'tech': ['Flutter', 'Dart'],
    'github': 'https://github.com/Saadgodin5/Graduation_webside',
    'live': null,
    'thumbnail': null,
  },
];

const List<Map<String, dynamic>> skillsData = [
  {'name': 'Flutter', 'percent': 92, 'icon': Icons.flutter_dash},
  {'name': 'Dart', 'percent': 88, 'icon': Icons.code},
  {'name': 'Firebase', 'percent': 75, 'icon': Icons.local_fire_department},
  {'name': 'Riverpod', 'percent': 80, 'icon': Icons.account_tree},
  {'name': 'Git', 'percent': 85, 'icon': Icons.folder},
];

const List<Map<String, dynamic>> educationData = [
  {'title': 'Bachelor of Computer Science', 'subtitle': 'University'},
  {'title': 'Flutter & Dart Development', 'subtitle': 'Online Course'},
  {'title': 'Advanced Mobile Development', 'subtitle': 'Certification'},
];

const List<Map<String, dynamic>> certificationsData = [
  {'title': 'Flutter Certified', 'subtitle': 'Google'},
  {'title': 'Firebase Professional', 'subtitle': 'Google'},
  {'title': 'Dart Developer', 'subtitle': 'Dart Team'},
];

const List<Map<String, dynamic>> languagesData = [
  {'name': 'English', 'code': 'EN', 'percent': 80},
  {'name': 'French', 'code': 'FR', 'percent': 80},
  {'name': 'Turkish', 'code': 'TR', 'percent': 70},
  {'name': 'Somali', 'code': 'SO', 'percent': 99},
  {'name': 'Arabic', 'code': 'AR', 'percent': 40},
];

// ═══════════════════════════════════════════════════════════════════════════
// Grain Overlay
// ═══════════════════════════════════════════════════════════════════════════

class _GrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final random = _SeededRandom(42);
    for (var i = 0; i < size.width * size.height * 0.2; i++) {
      canvas.drawCircle(
        Offset(random.nextDouble() * size.width, random.nextDouble() * size.height),
        0.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SeededRandom {
  _SeededRandom(this.seed);
  int seed;
  double nextDouble() {
    seed = (seed * 1103515245 + 12345) & 0x7fffffff;
    return seed / 0x7fffffff;
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Main App
// ═══════════════════════════════════════════════════════════════════════════

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: _bgDark,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const SadFlowApp());
}

class SadFlowApp extends StatelessWidget {
  const SadFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: _bgDark,
        colorScheme: const ColorScheme.dark(
          primary: _accentSoft,
          secondary: _accentWarm,
          surface: _bgDark,
          onSurface: Colors.white70,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const SadFlowPortfolio(),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Portfolio Page
// ═══════════════════════════════════════════════════════════════════════════

class SadFlowPortfolio extends StatefulWidget {
  const SadFlowPortfolio({super.key});

  @override
  State<SadFlowPortfolio> createState() => _SadFlowPortfolioState();
}

class _SadFlowPortfolioState extends State<SadFlowPortfolio> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final targetIndex = index.clamp(0, _sectionKeys.length - 1);
    final context = _sectionKeys[targetIndex].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image - brightened so it's clearly visible
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.2),
                BlendMode.plus,
              ),
              child: Image.asset(
                'assets/flowers/image1.jpeg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: _bgDark),
              ),
            ),
          ),
          // Soft overlay for comfortable viewing
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _bgDark.withValues(alpha: 0.4),
                    _bgDark.withValues(alpha: 0.5),
                    _bgDark.withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Column(
                children: [
                  _HeroSection(
                    key: _sectionKeys[0],
                    onViewWork: () => _scrollToSection(3),
                  ),
                  _SkillsSection(key: _sectionKeys[1]),
                  _LanguagesSection(key: _sectionKeys[2]),
                  _PortfolioSection(key: _sectionKeys[3]),
                  _EducationSection(key: _sectionKeys[4]),
                  _ContactSection(key: _sectionKeys[5]),
                ],
              ),
            ),
          ),
          _SidebarNav(onNavTap: _scrollToSection),
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.03,
                child: CustomPaint(
                  painter: _GrainPainter(),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Fixed Left Sidebar Navigation
// ═══════════════════════════════════════════════════════════════════════════

class _SidebarNav extends StatefulWidget {
  const _SidebarNav({required this.onNavTap});

  final void Function(int) onNavTap;

  @override
  State<_SidebarNav> createState() => _SidebarNavState();
}

class _SidebarNavState extends State<_SidebarNav> {
  int _activeIndex = 0;

  static const _icons = [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.work_rounded,
    Icons.school_rounded,
    Icons.language_rounded,
    Icons.mail_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(6, (i) {
              final isActive = _activeIndex == i;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _activeIndex = i),
                  onExit: (_) => setState(() => _activeIndex = 0),
                  child: GestureDetector(
                    onTap: () => widget.onNavTap(i),
                    child: AnimatedScale(
                      scale: isActive ? 1.05 : 1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? _accentSoft.withValues(alpha: 0.15)
                              : Colors.transparent,
                          border: Border.all(
                            color: isActive
                                ? _accentSoft.withValues(alpha: 0.8)
                                : _textFaded.withValues(alpha: 0.25),
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          _icons[i],
                          size: 22,
                          color: isActive ? _accentSoft : _textFaded,
                        ),
                      ),
                    ),
                  ),
                ),
                );
            }),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 1. Hero Section
// ═══════════════════════════════════════════════════════════════════════════

class _HeroSection extends StatefulWidget {
  const _HeroSection({super.key, this.onViewWork});

  final VoidCallback? onViewWork;

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection>
    with TickerProviderStateMixin {
  int _charIndex = 0;
  String _typedText = '';
  static const _roleText = "I'm a Flutter Developer";
  late AnimationController _avatarPulseController;
  late AnimationController _entranceController;
  late List<Animation<double>> _entranceAnimations;

  @override
  void initState() {
    super.initState();
    _avatarPulseController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat(reverse: true);
    _entranceController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _entranceAnimations = List.generate(6, (i) {
      return CurvedAnimation(
        parent: _entranceController,
        curve: Interval(i * 0.12, 0.6 + i * 0.08, curve: Curves.easeOutCubic),
      );
    });
    _startTyping();
  }

  @override
  void dispose() {
    _avatarPulseController.dispose();
    _entranceController.dispose();
    super.dispose();
  }

  void _startTyping() async {
    for (var i = 0; i <= _roleText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() {
        _typedText = _roleText.substring(0, i);
        _charIndex = i;
      });
    }
    await Future.delayed(const Duration(milliseconds: 2000));
    if (!mounted) return;
    setState(() => _charIndex = 0);
    _startTyping();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 24 : 40,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight - (isMobile ? 48 : 80)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
            // Avatar with pulse animation
            AnimatedBuilder(
              animation: _avatarPulseController,
              builder: (context, child) {
                final scale = 0.96 + (_avatarPulseController.value * 0.08);
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: FadeTransition(
                opacity: _entranceAnimations[0],
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.3),
                    end: Offset.zero,
                  ).animate(_entranceAnimations[0]),
                  child: Container(
                    width: isMobile ? 100 : 180,
                    height: isMobile ? 100 : 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _accentSoft.withValues(alpha: 0.4),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/flowers/image.pgj/profile.jpeg',
                        width: isMobile ? 100 : 180,
                        height: isMobile ? 100 : 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 36),
            FadeTransition(
              opacity: _entranceAnimations[1],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_entranceAnimations[1]),
                child: Text(
                  'Saad',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 36 : 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 12, offset: const Offset(0, 2)),
                      Shadow(color: Colors.black38, blurRadius: 24, offset: const Offset(0, 4)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: isMobile ? 4 : 8),
            FadeTransition(
              opacity: _entranceAnimations[2],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.15),
                  end: Offset.zero,
                ).animate(_entranceAnimations[2]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _typedText,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 18 : 22,
                        color: _accentSoft,
                        fontWeight: FontWeight.w500,
                        shadows: const [
                          Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 1)),
                        ],
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _charIndex < _roleText.length ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                        width: 2,
                        height: 22,
                        margin: const EdgeInsets.only(left: 2),
                        color: _accentSoft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: isMobile ? 12 : 20),
            FadeTransition(
              opacity: _entranceAnimations[3],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(_entranceAnimations[3]),
                child: SizedBox(
                  width: isMobile ? double.infinity : 520,
                  child: Text(
                    'Flutter developer specializing in cross-platform mobile and web apps. I build scalable solutions with Dart, Firebase, and Riverpod—from community websites to ML-integrated projects. Focused on clean architecture and smooth UX.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 15,
                      color: Colors.white70,
                      height: 1.55,
                      shadows: const [
                        Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 1)),
                        Shadow(color: Colors.black38, blurRadius: 16, offset: Offset(0, 2)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: isMobile ? 20 : 32),
            FadeTransition(
              opacity: _entranceAnimations[4],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_entranceAnimations[4]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PrimaryButton(
                      label: 'View My Work',
                      onPressed: widget.onViewWork ?? () {},
                    ),
                    const SizedBox(width: 16),
                    _OutlineButton(
                      label: 'Download CV',
                      onPressed: () => launchUrl(Uri.parse('mailto:saadgodin@yandex.com')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  const _PrimaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: _accentSoft,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _bgDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatefulWidget {
  const _OutlineButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: _hovered ? _accentSoft.withValues(alpha: 0.08) : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _accentSoft.withValues(alpha: 0.7),
                width: 1.5,
              ),
            ),
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: _accentSoft,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 2. Skills Section (with progress bars)
// ═══════════════════════════════════════════════════════════════════════════

class _SkillsSection extends StatelessWidget {
  const _SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      key: const ValueKey('skills'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 72,
      ),
      child: _FadeInSection(
        delay: const Duration(milliseconds: 300),
        child: _SectionCard(
        title: 'My Skills',
        subtitle: 'A passionate Flutter developer with experience in cross-platform apps.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: skillsData
              .map((s) => _SkillProgressBar(
                    name: s['name'] as String,
                    percent: s['percent'] as int,
                    icon: s['icon'] as IconData,
                  ))
              .toList(),
        ),
      ),
      ),
    );
  }
}

class _SkillProgressBar extends StatefulWidget {
  const _SkillProgressBar({
    required this.name,
    required this.percent,
    required this.icon,
  });

  final String name;
  final int percent;
  final IconData icon;

  @override
  State<_SkillProgressBar> createState() => _SkillProgressBarState();
}

class _SkillProgressBarState extends State<_SkillProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: widget.percent / 100)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.icon, size: 20, color: _accentSoft),
              const SizedBox(width: 12),
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '${widget.percent}%',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: _textFaded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: _cardBg,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: constraints.maxWidth * _animation.value,
                          decoration: BoxDecoration(
                            color: _accentSoft,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: _accentSoft.withValues(alpha: 0.4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 3. Portfolio Section
// ═══════════════════════════════════════════════════════════════════════════

class _PortfolioSection extends StatelessWidget {
  const _PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final crossAxisCount = isMobile ? 1 : 3;

    return Container(
      key: const ValueKey('portfolio'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 72,
      ),
      child: _FadeInSection(
        delay: const Duration(milliseconds: 500),
        child: _SectionCard(
        title: 'My Portfolio',
        subtitle: 'A collection of my recent projects.',
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
            childAspectRatio: isMobile ? 1.2 : 1.1,
          ),
          itemCount: projectsData.length,
          itemBuilder: (context, index) {
            return _ProjectCard(
              project: projectsData[index],
              index: index,
            );
          },
        ),
      ),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project, required this.index});

  final Map<String, dynamic> project;
  final int index;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _showProjectModal(context, widget.project),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -6.0 : 0.0)
            ..scale(_hovered ? 1.02 : 1),
          decoration: BoxDecoration(
            color: _cardBg.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovered
                  ? _accentSoft.withValues(alpha: 0.4)
                  : _cardBorder.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hovered ? 0.2 : 0.1),
                blurRadius: _hovered ? 20 : 12,
                offset: Offset(0, _hovered ? 6 : 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _accentSoft.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: _accentSoft.withValues(alpha: 0.5),
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    'BUILD COMPLETE',
                    style: GoogleFonts.robotoMono(
                      fontSize: 9,
                      color: _accentSoft,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: _bgDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.flutter_dash,
                          size: 40,
                          color: _accentSoft.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project['title'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: (widget.project['tech'] as List<String>)
                          .take(2)
                          .map((t) => Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Icon(
                                  Icons.check_circle_outline,
                                  size: 12,
                                  color: _textFaded,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProjectModal(BuildContext context, Map<String, dynamic> project) {
    showModalBottomSheet(
      context: context,
      backgroundColor: _cardBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['title'] as String,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              project['description'] as String,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: _textFaded,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (project['tech'] as List<String>)
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: _accentSoft.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(t, style: const TextStyle(color: _accentSoft, fontSize: 12)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            if (project['github'] != null)
              TextButton.icon(
                onPressed: () => launchUrl(Uri.parse(project['github'] as String)),
                icon: const Icon(Icons.code, size: 18, color: _accentSoft),
                label: const Text('View on GitHub', style: TextStyle(color: _accentSoft)),
              ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 4. Education Section (with tabs)
// ═══════════════════════════════════════════════════════════════════════════

class _EducationSection extends StatefulWidget {
  const _EducationSection({super.key});

  @override
  State<_EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<_EducationSection> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      key: const ValueKey('education'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 72,
      ),
      child: _FadeInSection(
        delay: const Duration(milliseconds: 700),
        child: _SectionCard(
        title: 'Education',
        subtitle: 'My learning journey and certifications.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _TabButton(
                  label: 'Education',
                  isActive: _tabIndex == 0,
                  onTap: () => setState(() => _tabIndex = 0),
                ),
                const SizedBox(width: 12),
                _TabButton(
                  label: 'Certifications',
                  isActive: _tabIndex == 1,
                  onTap: () => setState(() => _tabIndex = 1),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_tabIndex == 0)
              ...educationData.map((e) => _EducationItem(
                    title: e['title'] as String,
                    subtitle: e['subtitle'] as String,
                  )),
            if (_tabIndex == 1)
              ...certificationsData.map((e) => _EducationItem(
                    title: e['title'] as String,
                    subtitle: e['subtitle'] as String,
                  )),
          ],
        ),
      ),
      ),
    );
  }
}

class _TabButton extends StatefulWidget {
  const _TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<_TabButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: (widget.isActive || _hovered) ? 1.02 : 1,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: widget.isActive
                  ? _accentSoft.withValues(alpha: 0.2)
                  : _hovered
                      ? _accentSoft.withValues(alpha: 0.08)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isActive
                    ? _accentSoft
                    : _textFaded.withValues(alpha: 0.3),
                width: widget.isActive ? 1.5 : 1,
              ),
            ),
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: widget.isActive ? _accentSoft : _textFaded,
                fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  const _EducationItem({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _accentSoft.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.school_rounded, color: _accentSoft, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: _textFaded,
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

// ═══════════════════════════════════════════════════════════════════════════
// 5. Languages Section
// ═══════════════════════════════════════════════════════════════════════════

class _LanguagesSection extends StatelessWidget {
  const _LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      key: const ValueKey('languages'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 72,
      ),
      child: _FadeInSection(
        delay: const Duration(milliseconds: 900),
        child: _SectionCard(
          title: 'Languages',
        subtitle: 'The languages I speak and my proficiency level in each.',
        child: Column(
          children: languagesData
              .map((l) => _LanguageProgressBar(
                    name: l['name'] as String,
                    code: l['code'] as String,
                    percent: l['percent'] as int,
                  ))
              .toList(),
        ),
      ),
      ),
    );
  }
}

class _LanguageProgressBar extends StatefulWidget {
  const _LanguageProgressBar({
    required this.name,
    required this.code,
    required this.percent,
  });

  final String name;
  final String code;
  final int percent;

  @override
  State<_LanguageProgressBar> createState() => _LanguageProgressBarState();
}

class _LanguageProgressBarState extends State<_LanguageProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: widget.percent / 100)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _accentSoft.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                widget.code,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: _accentSoft,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: _cardBg,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                width: constraints.maxWidth * _animation.value,
                                decoration: BoxDecoration(
                                  color: _accentSoft,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${widget.percent}%',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: _textFaded,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 6. Contact Section
// ═══════════════════════════════════════════════════════════════════════════

class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 120,
        vertical: 72,
      ),
      child: Column(
        children: [
          Text(
            '© 2026 Saad',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: _textFaded.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FooterIcon(icon: Icons.code, url: 'https://github.com/$_githubUsername'),
              const SizedBox(width: 24),
              _FooterIcon(
                  icon: Icons.link, url: 'https://linkedin.com/in/godin_saad'),
              const SizedBox(width: 24),
              _FooterIcon(
                  icon: Icons.email, url: 'mailto:saadgodin@yandex.com'),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatefulWidget {
  const _FooterIcon({required this.icon, required this.url});

  final IconData icon;
  final String url;

  @override
  State<_FooterIcon> createState() => _FooterIconState();
}

class _FooterIconState extends State<_FooterIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedScale(
          scale: _hovered ? 1.2 : 1,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _hovered ? _accentSoft.withValues(alpha: 0.15) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              size: 22,
              color: _hovered ? _accentSoft : _textFaded,
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Fade-in wrapper for sections
// ═══════════════════════════════════════════════════════════════════════════

class _FadeInSection extends StatefulWidget {
  const _FadeInSection({
    required this.delay,
    required this.child,
  });

  final Duration delay;
  final Widget child;

  @override
  State<_FadeInSection> createState() => _FadeInSectionState();
}

class _FadeInSectionState extends State<_FadeInSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(_animation),
        child: widget.child,
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// Section Card Wrapper
// ═══════════════════════════════════════════════════════════════════════════

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: _cardBg.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: _cardBorder.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _accentSoft,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: _textFaded,
            ),
          ),
          const SizedBox(height: 32),
          child,
        ],
      ),
    );
  }
}
