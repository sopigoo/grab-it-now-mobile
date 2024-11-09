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