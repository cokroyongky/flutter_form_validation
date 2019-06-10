class Validation {
  String validatePasssword(String value) {
    if (value.length < 4) {
      //Cek bila value kurang dari 4 karakter
      return 'Password Minimal 4 Karakter';
    }
    return null; //Selain itu lolos validasi
  }

  String validateEmail(String value) {
    if (!value.contains('@')) {
      //Jika nilai tidak mengandung '@'
      return 'Email Tidak Valid';
    }
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) {
      //Jika Value Kosong
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }
}
