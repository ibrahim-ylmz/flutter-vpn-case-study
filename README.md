# VPN Case Study

Bu proje, Flutter kullanılarak geliştirilmiş bir VPN uygulaması case study çalışmasıdır. Uygulama, kullanıcıların farklı ülkelere bağlanmalarını, bağlantı istatistiklerini görüntülemelerini ve ücretsiz lokasyonlar arasında seçim yapmalarını sağlar.

## Kurulum

### Gereksinimler

- Flutter Version: **3.29.3**
- Dart SDK: **3.7.2** 

### Adımlar

1. Projeyi klonlayın:
   ```
   git clone https://github.com/ibrahim-ylmz/flutter-vpn-case-study.git
   ```

2. Proje dizinine gidin:
   ```
   cd flutter-vpn-case-study
   ```

3. Gerekli paketleri yükleyin:
   ```
   flutter pub get
   ```

4. Kod üretme işlemini çalıştırın (Route generator vb. için):

    **Generation dosyaları proje içerisinde bulunduğu için bu adım es geçilebilir.**
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
   
  

5. Uygulamayı çalıştırın:
   ```
   flutter run
   ```

## Kullanım

- **Ana Ekran**: Uygulama başladığında ana ekran açılır. Buradan bağlantı durumunu görebilir, ülke arayabilir ve bağlanmak istediğiniz ülkeyi seçebilirsiniz.
- **Bağlanma**: Herhangi bir ülke kartına tıklayarak o ülkeye bağlanabilirsiniz. Bağlantı kurulurken animasyonlu yükleme ekranı görüntülenir.
- **Bağlantı Kesme**: Aktif bağlantınız varken, bağlı olduğunuz ülke kartına tekrar tıklayarak bağlantıyı kesebilirsiniz.
- **Ülke Arama**: Üst kısımdaki arama simgesine tıklayarak ülke arama ekranına gidebilirsiniz.
- **İstatistikler**: Alt menüde bulunan istatistikler sekmesine tıklayarak bağlantı istatistiklerinizi görüntüleyebilirsiniz.
- **Ayarlar**: Alt menüde bulunan ayarlar sekmesinden tema değişikliği yapabilirsiniz.

## Proje Yapısı ve Mimari

Bu proje, MVVM (Model-View-ViewModel) mimarisi kullanılarak geliştirilmiştir. BLoC pattern uygulanmıştır.

### Klasör Yapısı

```
lib/
├── core/
│   ├── init/                 # Uygulama başlatma ve tema ayarları
│   ├── navigation/           # Yönlendirme (auto_route)
│   ├── utility/              # Yardımcı sınıflar, sabitler
│   └── widget/               # Tekrar kullanılabilir widget'lar
├── feature/
│   └── home/                 # Ana özellik modülü
│       ├── data/             # Veri katmanı
│       │   ├── datasources/  # Veri kaynakları
│       │   ├── models/       # Veri modelleri
│       │   └── repositories/ # Depolar
│       └── presentation/     # Sunum katmanı
│           ├── bloc/         # BLoC sınıfları
│           ├── pages/        # Sayfalar
│           └── widgets/      # UI bileşenleri
└── main.dart                 # Uygulama giriş noktası
```

### Mimari Kararlar

1. **MVVM Pattern**: 
   - **Model**: Data katmanında tanımlanan modeller (`Country`, `ConnectionStats`)
   - **View**: Presentation katmanındaki widget'lar ve sayfalar
   - **ViewModel**: BLoC sınıfları aracılığıyla yönetiliyor

2. **BLoC (Business Logic Component)**:
   - State management için BLoC kullanılmıştır
   - Her bir özellik için ayrı BLoC'lar oluşturulmuştur (ConnectionStatusBloc, CountryListBloc, ThemeBloc)

3. **Dependency Injection**:
   - GetIt kullanılarak bağımlılık enjeksiyonu sağlanmıştır
   - Bu sayede sınıflar arasındaki bağımlılıklar azaltılmış ve test edilebilirlik artırılmıştır

4. **Repository Pattern**:
   - Veri erişim katmanı repository pattern ile soyutlanmıştır
   - Mock veri kaynakları için kolay geçiş sağlanmıştır

5. **Routing**:
   - auto_route paketi ile tip güvenli routing sağlanmıştır
   - Nested routerlar kullanılarak tab bazlı navigasyon uygulanmıştır

6. **Test Edilebilirlik**:
   - BLoC'lar ve repository'ler, bağımlılık enjeksiyonu sayesinde kolayca test edilebilir yapıdadır

## Kullanılan Üçüncü Parti Paketler

| Paket | Versiyon | Açıklama |
|-------|----------|----------|
| **flutter_bloc** | ^9.1.1 | State management için BLoC pattern implementasyonu. Uygulamanın state'lerinin yönetilmesi ve UI ile veri katmanı arasındaki iletişimi sağlar. |
| **equatable** | ^2.0.7 | Sınıflara eşitlik karşılaştırması sağlar. BLoC'lar için state karşılaştırmaları ve gereksiz rebuild'leri önlemek için kullanılır. |
| **get_it** | ^8.0.3 | Hafif ve kullanımı kolay bir dependency injection container'ı. Servis locator pattern için kullanılmıştır. |
| **flutter_svg** | ^2.1.0 | SVG dosyalarını Flutter'da göstermek için kullanılır. Ülke bayrakları ve diğer vektör bazlı görseller için kullanılmıştır. |
| **auto_route** | ^10.0.1 | Tip güvenli routing sağlar. Code generation ile route'ları yönetmeyi kolaylaştırır. |

### Geliştirme Bağımlılıkları

| Paket | Versiyon | Açıklama |
|-------|----------|----------|
| **mockito** | ^5.4.6 | Mock nesneleri oluşturmak için kullanılan test kütüphanesi. Repository'leri test ederken kullanılmıştır. |
| **bloc_test** | ^10.0.0 | BLoC'ları test etmeyi kolaylaştıran yardımcı kütüphane. BLoC state değişimlerini test etmek için kullanılmıştır. |
| **very_good_analysis** | ^7.0.0 | Dart ve Flutter projeleri için gelişmiş analiz kuralları sağlar. Kod kalitesini ve temizliğini artırmak için kullanılmıştır. |
| **build_runner** | ^2.4.15 | Code generation için kullanılan build sistemi. AutoRoute ve Mockito için gereklidir. |
| **auto_route_generator** | ^10.0.1 | AutoRoute için route kodlarını otomatik oluşturan generator. |
