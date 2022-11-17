# Tugas 7
## Stateless widget dan stateful widget
- Stateless Widget
Dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah. Misal kita mempunya widget yang berisi text “Tugas 7” maka dari mulai text itu dibuat sampai aplikasi berjalan pun text tersebut tetap akan selalu menjadi “Tugas 7“.

- Stateful Widget
Stateful Widget merupakan widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Jadi dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget.

## Widget yang dipakai
- Padding
- Row
- FloatinActionButton
- Icon
- Spacer
- Text
- Column
- Center
- Scaffold

##  Fungsi dari setState()
Fungsi untuk merubah number pada koding diatas berubah karena adanya fungsi setState(). Pemanggilan fungsi setState() memberitahu framework bahwa state dalam objek ini telah berubah, sehingga framework akan memanggil method build() untuk reload UI

## Perbedaan const dan final
- Final: variabel yang hanya bisa diinisialisasi sekali dan value-nya tidak bisa diubah
- Const: value-nya harus diketahui saat compile time dan tidak bisa diubah setelahnya

## Implementasi 
- Membuat button plus dan button minus untuk increment dan decrement
- Membuat suatu kondisi jika counter nya itu ganjil atau genap, lalu membedakan hasil warnanya. 
- Membuat bonus, apabila counter 

# Tugas 8
## Perbedaan Navigator.push dan Navigator.pushReplacement.
- Navigator.push = berpindah halaman dan dapat kembali ke halaman sebelumnya
- Navigator.pushReplacement = berpindah halaman namun tidak dapat kembali ke halaman sebelumnya

## Widget apa saja yang dipakai
- Padding : memberikan jarak dalam komponennya
- Text : untuk menambahkan kata/kalimat
- Column : membuat widget sehingga bisa dalam bentuk vertikal
- Center : untuk membuat widget tersebut berada di tengah
- Container : untuk menampung yang di dalamnya widget-widget
- ListTile : membentuk sebuah list dan terdapat juga widget widget didalamnya.
- Drawer : untuk membuat drawer yang isinya adalah navigasi aplikasi

## Jenis-jenis event yang ada pada Flutter
- onTap : listener ketika user menekan widget satu kali
- onDoubleTap: listener ketika user menekan widget dua kali
- onLongPress: listener ketika user menekan dan menahan widget beberapa detik.
- onSaved: event yang terjadi ketika widget disimpan

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator mempunyai 2 API, yaitu declarative dan imperative.
- Imperative bisa diibaratkan saat kita memberi arah secara lengkap kepada supir taksi untuk menuju ke tempat yang kita tuju. Seperti dari Kantor A, kemudian lurus, belok kanan, lalu belok kiri, dan berhenti pas di depan minimarket. Informasi yang diberikan sangat lengkap sehingga si supir taksi tadi mendapatkan arahan yang jelas ke tempat tujuan.
- Declarative bisa diibaratkan saat kita hanya memberikan alamat yang akan kita tuju kepada supir taksi secara gamblang. Semisal “langsung berangkat ke minimarket A ya pak!”.

## Implementasi checklist
- buat navigasi dalam bentuk drawer, yang isinya ada 3 bagian yaitu counter_7, tambah budget, dan data budget
- Membuat halaman form yang isinya adalah untuk input budget, yaitu judul, nominal, tanggal, dan jenis
- Membuat jelas budget di file terpisah, yang gunanya untukmembuat objek budget setiap input data dan memasukkan nya ke dalam list
- Membuat halaman untuk data budget yang dibuat dalam file dart terpisah
