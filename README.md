# Tugas 1 Prak TPM - Layouting
**Tadeus Vito Gavra Sitanggang (123220105)**

**IF-G**
## Fitur Utama

1. **Widget View dengan Konten**:
   - Aplikasi ini memiliki sebuah **gambar** yang ditampilkan menggunakan widget `GlowImageWidget`. Gambar ini ditampilkan di tengah halaman dengan efek cahaya (glow), memberikan tampilan yang menarik pada aplikasi.

2. **AppBar**:
   - Di bagian atas aplikasi terdapat **AppBar** dengan judul "Cek Kodam".
   - Terdapat satu **action button** berupa ikon informasi (`Icons.info`). Ketika diklik, ikon ini akan menampilkan dialog pop-up yang berisi penjelasan tentang cara menggunakan aplikasi.

3. **Form Input**:
   - Aplikasi ini menggunakan widget `Form` untuk menangani input nama dari pengguna.
   - Pengguna diminta untuk memasukkan nama mereka melalui widget `TextFormField`. Kolom input ini dilengkapi dengan validator yang memastikan pengguna tidak meninggalkan kolom kosong.

4. **Tombol (Button)**:
   - **Cek Kodam Button**: Tombol ini akan menghasilkan "Kodam" acak berdasarkan nama yang dimasukkan oleh pengguna. Kodam ini akan ditampilkan di bawah form setelah tombol ditekan.
   - **Reset Button**: Tombol ini berfungsi untuk mereset form input (mengosongkan kolom nama) dan menghapus hasil "Kodam" yang sudah ditampilkan. Tombol ini diletakkan berdampingan dengan tombol "Cek Kodam" menggunakan widget `Row`.
