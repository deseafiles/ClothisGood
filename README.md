# ClothisGood

ClothisGood adalah aplikasi mobile berbasis Flutter yang membantu pengguna menemukan inspirasi outfit berdasarkan kondisi cuaca.


# Project Structure

```text
lib/
├── config/                         # Konfigurasi aplikasi
│   └── assets.dart                 # Konstanta dan path assets
│
├── services/                       # Service untuk kebutuhan umum aplikasi
│   ├── outfit_service.dart         # Logika pendukung outfit
│   ├── time.dart                   # Pengelolaan waktu
│   └── weather_service.dart        # Logika pendukung cuaca
│
├── data/                            # Pengelolaan sumber dan pengambilan data
│   ├── repositories/                # Abstraksi dan implementasi repository
│   │   ├── outfits/
│   │   │   ├── outfit_repository.dart
│   │   │   └── outfit_repository_impl.dart
│   │   │
│   │   └── weathers/
│   │       ├── weather_repository.dart
│   │       └── weather_repository_impl.dart
│   │
│   └── datasource/                  # Sumber data aplikasi
│       ├── api/
│       │   ├── api_client.dart      # HTTP client untuk komunikasi API
│       │   ├── cloth/
│       │   │   └── cloth_api_service.dart
│       │   └── weather/
│       │       └── weather_api_service.dart
│       │
│       └── local/
│           └── local_geolocator_service.dart
│
├── domain/                          # Representasi dan struktur data aplikasi
│   └── models/
│       ├── clothes/
│       │   ├── cloth.dart
│       │   ├── cloth_page.dart
│       │   ├── url.dart
│       │   └── user.dart
│       │
│       └── weathers/
│           ├── daily.dart
│           ├── daily_units.dart
│           ├── hourly.dart
│           ├── hourly_units.dart
│           ├── location_data.dart
│           └── weather.dart
│
├── routing/                         # Konfigurasi navigasi aplikasi
│   └── router.dart
│
├── ui/                              # Tampilan dan state management UI
│   ├── cloth/
│   │   ├── cloth_card.dart
│   │   ├── cloth_detail.dart
│   │   └── cloth_list_screen.dart
│   │
│   ├── home/
│   │   ├── home_screen.dart
│   │   ├── privacy_policy_screen.dart
│   │   ├── search_screen.dart
│   │   ├── setting_screen.dart
│   │   └── widgets/
│   │       ├── navigation_app_bar.dart
│   │       ├── search_app_bar.dart
│   │       ├── setting_bar_item.dart
│   │       └── setting_text_item.dart
│   │
│   ├── provider/
│   │   ├── outfit_riverpod.dart
│   │   └── weather_riverpod.dart
│   │
│   ├── splash/
│   │   └── splash_screen.dart
│   │
│   └── weather/
│       ├── backup/
│       │   ├── weather_card.old.dart
│       │   ├── weather_icon.old.dart
│       │   ├── weather_section.dart
│       │   └── weather_section.old.dart
│       ├── location_screen.dart
│       ├── weather_card.dart
│       └── weather_icon.dart
│
├── utils/                           # Helper dan konstanta umum
│   └── constant.dart
│
├── env.dart                         # Konfigurasi environment
└── main.dart                        # Entry point aplikasi
```
