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

</summary>
