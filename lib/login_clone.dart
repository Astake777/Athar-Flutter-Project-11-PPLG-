import 'package:flutter/material.dart';

class LoginClone extends StatefulWidget {
  const LoginClone({super.key});

  @override
  State<LoginClone> createState() => _LoginCloneState();
}

class _LoginCloneState extends State<LoginClone> {
  int _tab = 0; // 0 = Guru, 1 = Murid
  bool _sembunyikanPassword = true;

  @override
  Widget build(BuildContext context) {
    const biru = Color(0xFF2F80ED);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // biar bisa discroll pas keyboard muncul
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 180,
                  // kalau logo belum ada, pakai icon dulu
                  errorBuilder: (_, _, _) => const Icon(
                    Icons.school,
                    size: 180,
                    color: Color(0xFF2F80ED),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "Selamat Datang",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Masukkan niy dan password untuk mengakses",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 28),

              // toggle Guru / Murid
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _tabButton("Guru", 0),
                    _tabButton("Murid", 1),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text("NIY", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                decoration: _inputDecoration(
                  hint: "Masukkan NIY",
                  icon: Icons.email,
                ),
              ),
              const SizedBox(height: 24),

              const Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                obscureText: _sembunyikanPassword,
                decoration: _inputDecoration(
                  hint: "Masukkan password",
                  icon: Icons.shield,
                ).copyWith(
                  // icon mata untuk show/hide password
                  suffixIcon: IconButton(
                    icon: Icon(
                      _sembunyikanPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _sembunyikanPassword = !_sembunyikanPassword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {}, // belum ada fungsi login
                  style: ElevatedButton.styleFrom(
                    backgroundColor: biru,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Masuk", style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // tab putih kalau lagi dipilih
  Widget _tabButton(String label, int index) {
    final aktif = _tab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tab = index),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: aktif ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: aktif ? FontWeight.w600 : FontWeight.normal,
              color: aktif ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  // style textfield biar NIY & password sama
  InputDecoration _inputDecoration({required String hint, required IconData icon}) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    );
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: const Color(0xFF2F80ED)),
      contentPadding: const EdgeInsets.symmetric(vertical: 22),
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: Color(0xFF2F80ED)),
      ),
    );
  }
}
