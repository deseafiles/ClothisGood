import 'package:android/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:android/constant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int _currentIndex = 0;

  bool get isLastPage => _currentIndex == _onboardingPages.length - 1;

  final List<_OnboardingPageData> _onboardingPages = [
    _OnboardingPageData(
      highlightText: 'Find',
      normalText: ' Your Own Outfit',
      subTitle: 'Explore outfit inspiration for every kind of day.',
      icon: Icons.checkroom,
    ),
    _OnboardingPageData(
      highlightText: 'Match',
      normalText: ' Your Outfit',
      subTitle: 'Get outfit ideas that match the current weather around you.',
      icon: Icons.cloud_rounded,
    ),
    _OnboardingPageData(
      highlightText: 'Stay',
      normalText: ' Stylish Every Day',
      subTitle: 'Get inspired by curated fashion looks.',
      icon: Icons.auto_awesome,
    ),
  ];

  void _nextPage() {
    if (isLastPage) {
      _finishOnboarding();
      return;
    }

    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skipOnboarding() {
    _controller.animateToPage(
      _onboardingPages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: 
        (context) => DashboardScreen())
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ClothisGood',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Let's find your style!",
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _onboardingPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _onboardingPages[index];

                    return _OnboardingContent(
                      page: page,
                    );
                  },
                ),
              ),

              // Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingPages.length,
                  (index) => _IndicatorDot(
                    isActive: index == _currentIndex,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Next / Get Started button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Skip
              TextButton(
                onPressed: isLastPage ? null : _skipOnboarding,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isLastPage
                        ? AppColors.textSecondary.withValues(alpha: 0.3)
                        : AppColors.textSecondary.withValues(alpha: 0.7),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({
    required this.page,
  });

  final _OnboardingPageData page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        // Icon
        Container(
          width: 260,
          height: 260,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: AppColors.pinkLight.withValues(alpha: 0.35),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.pink.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              page.icon,
              size: 110,
              color: AppColors.primary,
            ),
          ),
        ),

        const SizedBox(height: 40),

        // Title
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 32,
              height: 1.2,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              color: AppColors.primary,
            ),
            children: [
              TextSpan(
                text: page.highlightText,
              ),
              TextSpan(
                text: page.normalText,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Subtitle
        Text(
          page.subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 14,
            height: 1.6,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary.withValues(
              alpha: 0.8,
            ),
          ),
        ),

        const Spacer(),
      ],
    );
  }
}

class _OnboardingPageData {
  final String highlightText;
  final String normalText;
  final String subTitle;
  final IconData icon;

  _OnboardingPageData({
    required this.highlightText,
    required this.normalText,
    required this.subTitle,
    required this.icon,
  });
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: isActive ? 24 : 7,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.primaryLight.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
