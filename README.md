# Grab It Now! - Mobile

Nama : Siti Shofi Nadhifa
<br>
NPM : 2306152172
<br>
Kelas : PBP D

<details>
<summary>Tugas 7</summary>

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak dapat diubah setelah dirender pertama kali. Tampilannya akan tetap sama selama aplikasi berjalan karena kondisi/state nya tidak bisa diubah. Contoh penggunaan stateless widget adalah widget yang menampilkan data statis atau teks. <br>
Stateful widget adalah widget yang bisa berubah selama aplikasi berjalan karena memiliki state yang dapat diperbarui atau dimodifikasi. Contoh penggunaan stateful widget adalah komponen UI yang responsif terhadap interaksi pengguna, seperti checkbox, radio button, atau slider. <br>
Perbedaan antara stateless widget dan stateful widget adalah stateless widget bersifat statis dan tidak memiliki state yang dapat diubah, sedangkan stateful widget bersifat dinamis dan memiliki state yang dapat diubah, sehingga bisa menyesuaikan tampilan dengan perubahan tersebut.

## 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- MyApp: Stateless widget sebagai app utama.
- Scaffold: Memberikan struktur dasar halaman, seperti AppBar dan body.
- AppBar: Menampilkan *application bar* di bagian atas layar dengan judul dan warna latar belakang yang diambil dari tema aplikasi.
- Padding: Menyediakan ruang atau jarak di sekitar widget tertentu.
- Column: Menyusun widget secara vertikal.
- Row: Menyusun beberapa widget secara horizontal dalam satu baris, dalam hal ini menampilkan tiga InfoCard.
- InfoCard (Custom Widget): Widget khusus untuk menampilkan informasi saya, yaitu NPM, nama, dan kelas.
- Card: Widget berbentuk kotak dengan bayangan untuk memberikan kesan seperti kartu, untuk menampilkan informasi.
- Text: Menampilkan teks di layar.
- GridView.count: Digunakan untuk menyusun ItemCard dalam grid dengan tiga kolom.
- ItemCard (Custom Widget): Widget khusus untuk menampilkan setiap item di halaman beranda.
- Material: Menyediakan efek material desain seperti InkWell. Digunakan untuk menambahkan warna latar belakang dengan sudut melengkung.
- InkWell: Memberikan efek ripple/gelombang ketika widget disentuh (memberikan efek interaktif saat pengguna menekan kartu).
- Icon: Digunakan untuk menampilkan ikon di dalam ItemCard.
- SnackBar: Menampilkan pesan notifikasi singkat di bagian bawah layar. SnackBar muncul ketika ItemCard ditekan, menampilkan nama item yang ditekan.
- MediaQuery: Digunakan dalam InfoCard untuk menyesuaikan lebar kartu berdasarkan lebar perangkat.

## 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` adalah fungsi/metode yang digunakan pada stateful widget untuk memperbarui state dari widget. Pemanggilan `setState()` pada Flutter memberitahu framework bahwa telah terjadi perubahan state, yang memicu rebuild atau render ulang pada widget yang memanggilnya, sehingga tampilan dari widget akan diperbarui. <br>
Variabel yang terdampak dari pemanggilan fungsi `setState()` adalah variabel variabel yang berada di dalam objek State dari widget tersebut.

## 4. Jelaskan perbedaan antara `const` dengan `final`.
`const` digunakan untuk mendeklarasikan nilai yang bersifat konstan dan immutable pada saat kompilasi.
`final` digunakan untuk mendeklarasikan nilai yang tidak bisa diubah setelah diinisialisasi.
Perbedaan antara `const` dan `final` adalah `const` konstan pada saat *compile-time*, sedangkan `final` konstan pada saat *run-time*.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Membuat proyek Flutter
  - Membuat direktori baru bernama `grab_it_now_mobile` yang akan dijadikan tempat proyek Flutter akan disimpan.
  - Generate proyek Flutter dengan menjalankan perintah dibawah ini pada terminal dan masuk ke direktori proyek tersebut.
    ```bash
    flutter create grab_it_now
    cd grab_it_now
    ```
  - Menjalankan proyek tersebut dengan `flutter run`.
  - Menghubungkan direktori lokal dengan repositori GitHub.
2. Membuat tiga tombol sederhana dengan ikon dan teks
  - Membuat class ItemHomepage yang berisi atribut-atribut dari card yang akan dibuat pada berkas `menu.dart`
    ```Dart
    ...
    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;

        ItemHomepage(this.name, this.icon, this.color);
    }
    ...
    ```
  - Membuat list item yang ingin ditambahkan pada class `MyHomePage`
    ```Dart
    class MyHomePage extends StatelessWidget {
        ...
        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFFE5E3C9)),
            ItemHomepage("Tambah Produk", Icons.add_shopping_cart, const Color(0xFFB4CFB0)),
            ItemHomepage("Logout", Icons.logout, const Color(0xFF94B49F)),
        ];
        ...
    }
    ```
  - Membuat class ItemCard untuk menampilkan tombol-tombol yang sudah dibuat
    ```Dart
    class ItemCard extends StatelessWidget {
        final ItemHomepage item;
    
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                // Membuat sudut kartu melengkung.
                borderRadius: BorderRadius.circular(12),
                
                child: InkWell(
                    ...
                    // Container untuk menyimpan Icon dan Text
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Column(
                                // Menyusun ikon dan teks di tengah kartu.
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        item.icon,
                                        color: Colors.white,
                                        size: 30.0,
                                    ),
                                    const Padding(padding: EdgeInsets.all(3)),
                                    Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            );
        }
    }
    ```
3. Mengimplementasikan warna yang berbeda untuk setiap tombol
  - Memberikan warna yang berbeda untuk setiap tombol dengan `const Color(hex kode warna)`
    ```Dart
    class MyHomePage extends StatelessWidget {
        ...
        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFFE5E3C9)),
            ItemHomepage("Tambah Produk", Icons.add_shopping_cart, const Color(0xFFB4CFB0)),
            ItemHomepage("Logout", Icons.logout, const Color(0xFF94B49F)),
        ];
        ...
    }
    ```
  - Assign warna sesuai dengan warna dari item pada class ItemCard
    ```Dart
    class ItemCard extends StatelessWidget {
        final ItemHomepage item;
    
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                ...
            );
        }
    }
    ```
4. Memunculkan `Snackbar`
  - Menambahkan aksi pada saat item di klik dan memunculkan `Snackbar`
    ```Dart
    class ItemCard extends StatelessWidget {
        final ItemHomepage item; 
    
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
                ...
                child: InkWell(
                    // Aksi ketika kartu ditekan.
                    onTap: () {
                    // Menampilkan pesan SnackBar saat kartu ditekan.
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                        );
                    },
                    ...
                ),
            );
        }
    }
    ```

</details>

<details>
<summary>Tugas 8</summary>

## 1.  Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Di Flutter, `const` digunakan untuk membuat objek yang bersifat *immutable* dan disimpan dalam memori sebagai *compile-time constant*. 

Keuntungan dari menggunakan `const` adalah:
- Efisiensi memori: objek yang dideklarasikan sebagai `const` akan dibuat hanya sekali dan disimpan dalam cache, sehingga dapat digunakan kembali.
- Kinerja lebih baik: karena bersifat immutable, Flutter dapat melakukan optimasi sehingga aplikasi berjalan lebih cepat.
- Stabilitas: ojek `const` tidak dapat diubah setelah dideklarasikan sehingga mengurangi potensi kesalahan karena perubahan yang tidak terduga.

`const` sebaiknya digunakan pada widget atau objek yang tidak berubah atau untuk widget yang akan ditampilkan berulang kali tanpa perubahan. `const` sebaiknya tidak digunakan pada objek atau widget yang dinamis atau ketika nilainya bergantung pada variabel yang berubah.

## 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk mengatur posisi widget secara vertikal atau horizontal.
- `Column` digunakan untuk mengatur widget secara vertikal. Widget ini berguna untuk menampilkan elemen dalam satu kolom, seperti daftar teks atau tombol yang disusun vertikal.
Contoh implementasi Column:
```dart
Column(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    ElevatedButton(onPressed: () {}, child: Text("Button")),
  ],
)
```
- `Row` digunakan untuk mengatur widget secara horizontal. Widget ini digunakan untuk menampilkan elemen dalam satu baris, seperti ikon dan teks yang sejajar.
Contoh implementasi Row:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Rating"),
    Text("5.0"),
  ],
)
```

## 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form yang saya buat, elemen input yang saya gunakan antara lain:
- TextFormField: untuk menerima input teks.
- ElevatedButton: untuk tombol submit data pada form.

Elemen input yang tidak saya gunakan:
- Checkbox: untuk pilihan ya/tidak.
- DropdownButton: untuk memilih salah satu opsi dari beberapa pilihan.
- Slider: untuk memilih nilai pada rentang tertentu.
- Switch: untuk memilih anatar on/off.

## 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam Flutter, kita dapat menggunakan `ThemeData` di properti `theme` dari `MaterialApp`. `ThemeData` memungkinkan kita untuk mengatur gaya seperti pengaturan warna, font, button, dan beberapa hal lain agar konsisten pada keseluruhan aplikasi. Pengaturan tema ini berada pada file `main.dart`
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF789395),
    secondary: const Color(0xFF94B49F),
  ),
  useMaterial3: true,
),
```

## 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangani navigasi pada aplikasi Flutter dengan banyak halaman, saya menggunakan `Navigator` untuk berpindah antar halaman. Dengan `Navigator`, kita bisa melakukan *push* untuk menambahkan halaman baru pada stack dan membuka halaman baru tersebut, *pop* untuk kembali ke halaman sebelumnya, atau *pushReplacement* untuk menghapus halaman yang ada pada stack dan mengganti ke halaman baru yang ingin ditambahkan.
Navigasi juga didukung dengan adanya *Drawer*, baik pada sisi kiri ataupun kanan layar, yang berfungsi untuk memudahkan pengguna dalam mengakses halaman-halaman yang ada pada aplikasi.
Contoh implementasi:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ProductEntryFormPage(),
  )
);
```

</details>

<details>
<summary>Tugas 9</summary>

## 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data `JSON`? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Model diperlukan untuk pengambilan/pengiriman data JSON dengan memastikan data memiliki struktur dan tipe yang sesuai, memudahkan validasi, dan mengelola konversi antara format JSON dan objek dalam aplikasi. Dengan model, pengolahan data menjadi lebih terorganisasi, sehingga mengurangi risiko error ketika data diterima atau dikirims. Tanpa model, pengelolaan data menjadi sulit dan rawan salah, terutama jika struktur JSON tidak konsisten.

## 2. Jelaskan fungsi dari library *http* yang sudah kamu implementasikan pada tugas ini
Library `http` pada Flutter digunakan untuk melakukan permintaan `HTTP` ke server. Fungsi dari library `http` sendiri adalah:
- Mengambil data: Untuk mendapatkan data dari API menggunakan metode seperti `GET`
- Mengirim data: Untuk mengirimkan data ke server menggunakan metode seperti `POST`, `PUT`, atau `DELETE`
- Mengelola header: Mendukung manipulasi header HTTP untuk autentikasi, pengiriman format JSON, dll
- Pemrosesan respons: Mengelola respons dari server, termasuk status kode dan data yang diterima

## 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa *instance* CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` mempermudah pengelolaan sesi pengguna dengan menggunakan cookie pada Flutter. Fungsi `CookieRequest` adalah:
- Menyimpan dan Mengirim Cookie: Cookie dari server disimpan di sisi klien dan dikirim kembali ke server pada permintaan berikutnya untuk mempertahankan sesi pengguna.
- Autentikasi Berbasis Sesi: Memastikan bahwa permintaan ke server hanya dilakukan oleh pengguna yang sudah login.
*Instance* `CookieRequest` perlu dibagikan ke semua komponen di aplikasi karena:
- Konsistensi Sesi: Untuk memastikan sesi pengguna tetap terjaga di seluruh aplikasi.
- Efisiensi: Menghindari kebutuhan membuat ulang sesi atau autentikasi berulang kali.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. Input pada Flutter: Data dimasukkan pengguna dan ditangkap oleh widget Flutter.
2. Pengolahan Data: Data diubah menjadi format JSON, lalu dikirim menggunakan library seperti http.
3. Pengiriman ke Backend: Data dikirim ke API Django menggunakan metode HTTP.
4. Pemrosesan di Backend:
    - Django menerima dan memvalidasi data.
    - Data diolah atau disimpan dalam database.
    - Django mengirimkan respons ke Flutter.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Login
1. Pengguna mengisi kredensial di Flutter.
2. Flutter mengirim data ke endpoint login Django menggunakan metode POST.
3. Django memvalidasi kredensial dan, jika valid:
4. Membuat sesi pengguna.
5. Mengembalikan cookie atau token autentikasi ke Flutter.
6. Flutter menyimpan cookie/token menggunakan CookieRequest.

Register
1. Pengguna mengisi data registrasi di Flutter.
2. Data dikirim ke endpoint registrasi Django menggunakan POST.
3. Django memvalidasi data dan:
4. Membuat akun baru jika valid.
5. Memberikan respons sukses atau pesan error ke Flutter.

Logout
1. Flutter mengirim permintaan logout ke Django menggunakan POST (biasanya dengan cookie/token).
2. Django menghapus sesi pengguna.
3. Flutter menghapus data autentikasi lokal, seperti cookie/token.

Setelah Autentikasi
- Setelah login berhasil, Flutter dapat mengakses menu atau halaman lain.
- Semua permintaan HTTP selanjutnya yang memerlukan autentikasi menyertakan cookie/token untuk memastikan pengguna valid.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*! (bukan hanya sekadar mengikuti tutorial).
1. Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
   - Menambahkan fungsi `register` di berkas `views.py` pada app `authentication` proyek Django
      ```python
      from django.contrib.auth.models import User
      import json
      ...
      @csrf_exempt
      def register(request):
          if request.method == 'POST':
              data = json.loads(request.body)
              username = data['username']
              password1 = data['password1']
              password2 = data['password2']

              # Check if the passwords match
              if password1 != password2:
                  return JsonResponse({
                      "status": False,
                      "message": "Passwords do not match."
                  }, status=400)
              
              # Check if the username is already taken
              if User.objects.filter(username=username).exists():
                  return JsonResponse({
                      "status": False,
                      "message": "Username already exists."
                  }, status=400)
              
              # Create the new user
              user = User.objects.create_user(username=username, password=password1)
              user.save()
              
              return JsonResponse({
                  "username": user.username,
                  "status": 'success',
                  "message": "User created successfully!"
              }, status=200)
          
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Invalid request method."
              }, status=400)
      ```
   - Menambahkan routing ke fungsi `register` di berkas `urls.py` pada app `authentication` proyek Django
      ```python
      from django.urls import path
      from authentication.views import register

      app_name = 'authentication'

      urlpatterns = [
          path('register/', register, name='register'),
      ]
      ```
   - Membuat berkas `register.dart` pada folder `lib/screens` proyek Flutter
      ```dart
      import 'dart:convert';
      import 'package:flutter/material.dart';
      import 'package:grab_it_now/screens/login.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';

      class RegisterPage extends StatefulWidget {
        const RegisterPage({super.key});

        @override
        State<RegisterPage> createState() => _RegisterPageState();
      }

      class _RegisterPageState extends State<RegisterPage> {
        final _usernameController = TextEditingController();
        final _passwordController = TextEditingController();
        final _confirmPasswordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () async {
                            String username = _usernameController.text;
                            String password1 = _passwordController.text;
                            String password2 = _confirmPasswordController.text;

                            // Cek kredensial
                            // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                            // Untuk menyambungkan Android emulator dengan Django pada localhost,
                            // gunakan URL http://10.0.2.2/
                            final response = await request.postJson(
                                "http://127.0.0.1:8000/auth/register/",
                                jsonEncode({
                                  "username": username,
                                  "password1": password1,
                                  "password2": password2,
                                }));
                            if (context.mounted) {
                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Successfully registered!'),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to register!'),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```
2. Membuat halaman login pada proyek tugas Flutter.
   - Menambahkan fungsi `login` di berkas `views.py` pada app `authentication` proyek Django
      ```python
      from django.contrib.auth import authenticate, login as auth_login
      from django.http import JsonResponse
      from django.views.decorators.csrf import csrf_exempt
      ...
      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  # Status login sukses.
                  return JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login sukses!"
                  }, status=200)
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login gagal, akun dinonaktifkan."
                  }, status=401)

          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, periksa kembali email atau kata sandi."
              }, status=401)
      ```
    - Menambahkan routing ke fungsi `login` di berkas `urls.py` pada app `authentication` proyek Django
      ```python
      from django.urls import path
      from authentication.views import login

      app_name = 'authentication'

      urlpatterns = [
          path('login/', login, name='login'),
      ]
      ```
   - Membuat berkas `login.dart` pada folder `lib/screens` proyek Flutter
      ```dart
      import 'package:grab_it_now/screens/menu.dart';
      import 'package:flutter/material.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';
      import 'package:grab_it_now/screens/register.dart';

      void main() {
        runApp(const LoginApp());
      }

      class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            title: 'Login',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
              ).copyWith(secondary: Colors.deepPurple[400]),
            ),
            home: const LoginPage(),
          );
        }
      }

      class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        State<LoginPage> createState() => _LoginPageState();
      }

      class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            // Cek kredensial
                            // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                            // Untuk menyambungkan Android emulator dengan Django pada localhost,
                            // gunakan URL http://10.0.2.2/
                            final response = await request
                                .login("http://127.0.0.1:8000/auth/login/", {
                              'username': username,
                              'password': password,
                            });

                            if (request.loggedIn) {
                              String message = response['message'];
                              String uname = response['username'];
                              if (context.mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("$message Selamat datang, $uname.")),
                                  );
                              }
                            } else {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Login Gagal'),
                                    content: Text(response['message']),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 36.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: Text(
                            'Don\'t have an account? Register',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```
3. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
   - Membuat dan melakukan pengaturan app `authentication` pada Django
   - Menjalankan `pip install django-cors-headers` untuk menginstall library yang dibutuhkan dan menambahkan `django-cors-headers` ke berkas `requirements.txt` pada proyek Django
   - Menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` pada berkas `settings.py` proyek Django
   - Menambahkan beberapa variabel pada berkas `settings.py` proyek Django
      ```python
      ...
      CORS_ALLOW_ALL_ORIGINS = True
      CORS_ALLOW_CREDENTIALS = True
      CSRF_COOKIE_SECURE = True
      SESSION_COOKIE_SECURE = True
      CSRF_COOKIE_SAMESITE = 'None'
      SESSION_COOKIE_SAMESITE = 'None'
      ...
      ```
   - Menambahkan `path('auth/', include('authentication.urls')),` pada berkas `grab_it_now/urls.py`
   - Menginstall beberapa package flutter
      ```bash
      flutter pub add provider
      flutter pub add pbp_django_auth
      ```
   - Menyediakan `CookieRequest` library ke semua child widgets dengan menggunakan `Provider`
4. Membuat model kustom sesuai dengan proyek aplikasi Django.
   - Membuka endpoint `JSON` dari proyek Django
   - Mengubah data JSON tersebut menjadi data dart
   - Menyimpan data dart tersebut ke berkas `product_entry.dart` pada folder `lib/models` di proyek Flutter
5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint `JSON` di Django yang telah kamu deploy.
   - Membuat berkas `list_productentry.dart` yang menampilkan daftar semua item dari endpoint `JSON` di Django
      ```dart
      import 'package:flutter/material.dart';
      import 'package:grab_it_now/models/product_entry.dart';
      import 'package:grab_it_now/screens/detail_product.dart';
      import 'package:grab_it_now/widgets/left_drawer.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';

      class ProductEntryPage extends StatefulWidget {
        const ProductEntryPage({super.key});

        @override
        State<ProductEntryPage> createState() => _ProductEntryPageState();
      }

      class _ProductEntryPageState extends State<ProductEntryPage> {
        Future<List<Product>> fetchProduct(CookieRequest request) async {
          // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
          final response = await request.get('http://127.0.0.1:8000/json/');
          
          // Melakukan decode response menjadi bentuk json
          var data = response;
          
          // Melakukan konversi data json menjadi object Product
          List<Product> listProduct = [];
          for (var d in data) {
            if (d != null) {
              listProduct.add(Product.fromJson(d));
            }
          }
          return listProduct;
        }

        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Entry List'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          "It looks like we don't have any products yet! Come back to shop when our products are ready! 🛍️",
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        final product = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProductPage(product: product),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("Rp${snapshot.data![index].fields.price}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.stock}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.description}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.category}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.rating}")
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          );
        }
      }
      ```
   - Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
    Pada `child: Column` dari `return.ListView.builder` pada class `_ProductEntryPageState extends State<ProductEntryPage>`
    ```dart
    ...
    Text(
      "${snapshot.data![index].fields.name}",
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 10),
    Text("Rp${snapshot.data![index].fields.price}"),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.stock}"),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.description}"),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.category}"),
    const SizedBox(height: 10),
    Text("${snapshot.data![index].fields.rating}")
    ...
    ```
6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
   - Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
   - Tampilkan seluruh atribut pada model item kamu pada halaman ini.
   - Tambahkan tombol untuk kembali ke halaman daftar item.

   Menambahkan routing ke halaman detail produk pada halaman list produk
    ```dart
    ...
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductPage(product: product),
          ),
        );
      },
    )
    ...
    ```
   Membuat berkas `detail_product` pada folder `lib/screens` di proyek Flutter
    ```dart
    import 'package:flutter/material.dart';
    import 'package:grab_it_now/models/product_entry.dart';

    class DetailProductPage extends StatelessWidget {
      final Product product;

      const DetailProductPage({super.key, required this.product});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.fields.name),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.fields.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Price: Rp${product.fields.price}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Stock: ${product.fields.stock}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Description: ${product.fields.description}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Category: ${product.fields.category}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Rating: ${product.fields.rating}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back to List"),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    ```
7. Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
   - Flutter menggunakan `pbp_django_auth` untuk mengelola sesi pengguna. Saat mengirim permintaan ke Django menggunakan `CookieRequest`, cookie autentikasi pengguna akan disertakan dalam setiap permintaan. Jika pengguna belum login, permintaan ke server akan gagal
   - Menyertakan `user=request.user` pada fungsi `create_product_flutter` pada berkas `views.py` di folder `main` proyek Django saat menambahkan produk baru

</details>