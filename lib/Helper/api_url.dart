class ApiUrl {
  // Ganti localhost dengan 10.0.2.2 jika menggunakan emulator Android
  // atau dengan alamat IP dari mesin yang menjalankan server API
  static const String baseUrl = 'http://192.168.65.138:8080/multirole-api/public';

  static const String registerManager = baseUrl + '/register/manager';
  static const String registerTechnician = baseUrl + '/register/technician';
  static const String loginManager = baseUrl + '/login/manager';
  static const String loginTechnician = baseUrl + '/login/technician';
}