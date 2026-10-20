import 'package:android/ui/home/home_screen.dart';
import 'package:android/ui/home/privacy_policy_screen.dart';
import 'package:android/ui/home/search_screen.dart';
import 'package:android/ui/home/setting_screen.dart';
import 'package:android/ui/home/widgets/navigation_app_bar.dart';
import 'package:android/ui/splash/splash_screen.dart';
import 'package:android/ui/weather/location_screen.dart';
import 'package:go_router/go_router.dart';

//menggunakan shellroute karena setiap kali pindah halaman(misal dari home ke settings) flutter akan menghapus seluruh tampilan di layar dan menggambar ulang dari 0, sedangkan dengan shellroute menu dibungkus dalam shell. Jadi saat berpindah halaman hanya body tengah saja yang diganti.

//contoh implementasi ada di yt, jadi kalau masuk ke yt short itu bisa tetap menggulir layar tanpa navbar di bawahnya menghilang atau dibangun dari nol. Shellroute juga lebih hemat daya ketimbang tanpa memakai karena hanya merender ulang konten yang diperlukan saja.

//shellroute biasa bekerja dengan pindah dari tab a ke tab b, lalu kembali ke tab a maka posisi akan tereset misalnya scroll ke bawah pada tab a lalu pindah halaman tab b maka saat kembali ke tab a akan berada di posisi paling atas. Statefullshellroute akan membuat data yang sedang dimuat sebelumnya tidak akan hilang (tetap di posisi terakhir)

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [ 
    GoRoute(
      path: '/', 
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => NavigationAppBar(shell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home', 
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search', 
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/setting', 
              builder: (context, state) => const SettingScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/privacy-policy', 
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: '/find-location', 
      builder: (context, state) => const LocationScreen(),
    ),

  ], 
);

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) => HomeScreen(),
//     ),
//
//     GoRoute(
//       path: '/search',
//       builder: (context, state) => SearchScreen(),
//     ),
//     //
//     GoRoute(
//       path: '/setting',
//       builder: (context, state) => SettingScreen(),
//     ),
//   ],
// );
