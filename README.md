# counter_7

Catherine Angel Robin
2106705392/D

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
