import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Import controller Anda
import '../controller/registration_controller.dart'; 
// Import custom button
import '../components/custom_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    final RegistrationController controller = Get.put(RegistrationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Menggunakan komponen bawaan Flutter (TextField) 
                // untuk mengatasi error CustomTextField sementara
                TextField(
                  controller: controller.fullNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: 20),

                // dropdown jenis kelamin
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.jenisKelamin.value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Jenis Kelamin',
                    ),
                    items: controller.listJenisKelamin
                        .map(
                          (jk) => DropdownMenuItem(value: jk, child: Text(jk)),
                        )
                        .toList(),
                    onChanged: (value) => controller.pilihJenisKelamin(value!),
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controller.alamatController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controller.noWaController,
                  // no wa hanya boleh angka
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No WA',
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: controller.passwordController,
                  obscureText: true, // Menyembunyikan password
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 40),

                // Komponen Button custom. 
                // Error sebelumnya menyatakan parameter 'text' wajib ada
                CustomButton(
                  text: 'Register', // Diubah menjadi text sesuai error
                  onPressed: () {
                    // Memanggil fungsi dari controller agar variabel 'controller' terpakai
                    controller.register();
                  }, label: 'Register', myText: 'Register', 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}