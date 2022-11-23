# counter_7

Catherine Angel Robin
2106705392/D

## **TUGAS 9**

## Can we fetch a JSON data without making a model first? If yes, is it better than making a model first?

Yes, it is possible to fetch a JSON data without making a model at first. We can make a dynamic map from the JSON and access the value like a dictionary in python (`data[key]`). But it is not a good practice as we wouldn't know if there is a missing field or the fields is not what we expect, so I'll be hard to manage and error-prone. That being said, it is obvious that it's not better than making a model first.

## Widgets used in this assignment

- `ListTile`: Used to populate a ListView in _Flutter_. It contains title as well as leading or trailing icons.
- `Checkbox`: Used to make a clickable checkbox.
- `Row`: Display widgets in a Row.
- `TextButton`: It is a simple Button without any border that listens for _onPressed_ and _onLongPress_ gestures.
- `FutureBuilder`: Widget that builds itself based on the latest snapshot of interaction with a Future.

## How fetching data from json in flutter works

Data is fetched using HTTP in `fetchWatchlist` function that call the get function by HTTP instances. The function returns the list of `MyWatchlist` object. `FutureBuilder` will call the function and wait for its response. When the data is fetched, `FutureBuilder` returns `ListView.builder` that builds `ListTiles` containing the mapped data that we get from `fetchWatchlist` function.

## Implementation

1. Create `watchlist.dart` with Watchlist class in model directory.
2. Create `fetch_watchlist.dart` and make a function like this to fetch data from the API.
3. Create `watchlist.dart` in pages directory and make a `WatchlistPage StatefulWidget` that contains `FutureBuilder` that fetch data using `fetchWatchlist` function.
4. Create `watchlistDetail.dart` in pages directory and make a `MyWatchlistDetailPage StatelessWidget` that displays the data that passed on from `MyWatchlistPage`.
5. Pass data from `MyWatchlistPage` to `MyWatchlistDetailPage` using `Navigator.push`.

6. Create `CheckBox` widget and its `onChanged` function for Bonus.

## **TUGAS 8**

<hr />

## perbedaan Navigator.push dan Navigator.pushReplacement.

Navigator.push menambahkan route ke stack yang berisi route-route aplikasi sedangkan Navigator.pushReplacement menambahkan route pada stack dan men-dispose route sebelumnya.

## widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Material App : sebagai root dari aplikasi
- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi
- Text : Display string dalam satu baris
- TextButton: Button sebagai call to action
- AppBar : display toolbar widgets, seperti title dan actions
- Padding : widget yang insets child dengan memberikan padding
- Drawer : Panel Desain Material yang meluncur secara horizontal dari tepi Scaffold untuk menampilkan tautan navigasi dalam aplikasi.
- Column : Mendisplay widget childnya dalam format vertikal.
- SizedBox : Sebuah kotak dengan ukuran tertentu. Jika diberikan anak, widget ini memaksa anaknya untuk memiliki lebar dan/atau tinggi tertentu
- Form : Wadah opsional untuk mengelompokkan beberapa widget bidang formulir (mis. widget TextField).
- FormField: mempertahankan status bidang formulir saat ini, sehingga pembaruan dan kesalahan validasi tercermin secara visual di UI.
- Container : Widget kenyamanan yang menggabungkan lukisan umum, penentuan posisi, dan widget ukuran.
- Icon : Material Design Icon
- ListTile : widget yang berisi 1-3 baris text dan memiliki property trailling dan leading untuk penempatan text tersebut.

## jenis-jenis event yang ada pada Flutter (contoh: onPressed)

onPressed, onChanged, AnimationEvent, ClipboardEvent, ErrorEvent , dll

## cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.

Navigator pada Flutter diimplementasikan dengan menggunakan stack. Navigator pada flutter juga menerapkan method-method pada stack seperti push dan pop. Navigator menyediakan metode untuk mengubah tumpukan dengan push to stack atau dengan keluar dari tumpukan. Metode Navigator.push adalah untuk menavigasi ke halaman yang lebih baru dan Navigator.pop untuk kembali dari halaman saat ini.

## Implementasi

1. menambahkan navigation dengan menggunakan drawer pada semua screen aplikasi
2. membuat bugdetForm.dart yang berisi screen form dan tampilan data budget yang telah diisi.
3. menambahkan field-field yang dibutuhkan untuk form budget, antara lain:
   a.Text Field : untuk menerima input judul dan nominal. Yntuk nominal text field akan diberi constraint hanya berupa integer
   b. Dropdown: untuk memerima input jenis budget, yaitu pengeluaran atau pemasukan

4. Save data yang sudah diisi oleh user ke dalam list. Lalu "passing" list tersebut dengan context ke screen MyDataPage melalui parameter page tersebut.
5. Tampikan data dari list.

## **TUGAS 7**

<hr />
## stateless widget dan stateful widget

Stateless widget bersifat, artinya seluruh konfigurasi yang sudah diinisiasi sejak awal dibuat. Berbeda dengan stateless widget, stateful widget bersifat dinamis. Stateful widget ini dapat berubah berdasarkan interaksi user atau adanya mutasi data.

## widget yang dipakai di proyek

Berikut adalah widget-widget yang digunakan dalam

- Material App : sebagai root dari aplikasi
- Scaffold : menyediakan struktur dasar dan styling dalam aplikasi
- Column : Display children dalam format vertikal
- Row : Display children dalam format horizontal
- Text : Display string dalam satu baris
- AppBar : display toolbar widgets, seperti title dan actions

## Apa fungsi dari setState()?

Fungsi setState digunakan ketika terjadi perubahan pada program. Jika ada perubahan, maka aplikasi akan dibuild ulang dan displaynya akan berubah sesuai dengan state yang mengalami perubahan. Jika ada perubahan variabel, misal \_counter, tapi tidak ada setState() maka tidak akan terjadi apa-apa pada display.

## perbedaan antara const dengan final

final dan const sama-sama merupakan variabel immutable. const harus sudah ada saat program dikompilasi dan nilainya bersifat konstan sedangkan final dapat diketahui atau belum nilainya saat waktu kompilasi.

## Implementasi

1. Membuat proyek flutter baru dengan command

```
flutter create counter_7
```

2. Membuat fungsi untuk men-decrement counter

```
 void _decrementCounter() {
    setState(() {
      _counter > 0 ? {_counter--} : _isButtonDisable = true;
    });
  }
```

3. Menambahkan if condition untuk menampilkan text 'genap' jika counter bernilai genap dan 'ganjil' jika counter bernilai ganjil

4. menambahkan button 'kurang' pada floatingActionButton dengan menggunakan Padding dan Row untuk meng-align button tersebut.

5. Pastikan button 'kurang' di-disable ketika counter bernilai 0
