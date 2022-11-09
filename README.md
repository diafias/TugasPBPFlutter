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