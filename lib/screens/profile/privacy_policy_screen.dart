part of '../screens.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Text(
          "Kebijakan Privasi",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "1. Pendahuluan\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Kebijakan Privasi ini menjelaskan bagaimana Aplikasi PasalSatu mengumpulkan, menggunakan, dan mengungkapkan informasi pribadi Anda (\"Informasi Pribadi\") yang kami kumpulkan dari Anda saat Anda menggunakan Aplikasi kami.",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "2. Pengumpulan Informasi Pribadi\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Kami mengumpulkan Informasi Pribadi dari Anda ketika Anda:\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Membuat akun di Aplikasi kami\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Menggunakan Aplikasi kami\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Berkomunikasi dengan AI atau Pengguna lain\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Informasi Pribadi yang kami kumpulkan mungkin termasuk:\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Nama Anda\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Alamat Email Anda\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Kata Sandi Anda",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "3. Penggunaan Informasi Pribadi\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: "Kami menggunakan Informasi Pribadi Anda untuk:\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Menyediakan dan meningkatkan Aplikasi kami\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Menganalisis penggunaan Aplikasi kami\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                    TextSpan(
                      text: "• Mencegah penipuan dan penyalahgunaan",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "4. Pengungkapan Informasi Pribadi\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Kami tidak akan mengungkapkan Informasi Pribadi Anda kepada pihak ketiga tanpa persetujuan Anda terlebih dahulu, kecuali jika diwajibkan oleh hukum.",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "5. Keamanan Informasi Pribadi\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Kami mengambil langkah-langkah keamanan yang wajar untuk melindungi Informasi Pribadi Anda dari akses, penggunaan, pengungkapan, pengubahan, atau perusakan yang tidak sah.",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "6. Pilihan Anda\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Anda dapat mengakses, memperbarui, atau menghapus Informasi Pribadi Anda kapan saja dengan menghubungi kami",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "7. Perubahan pada Kebijakan Privasi Ini\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Kami akan memberi tahu Anda tentang perubahan apa pun dengan memposting Kebijakan Privasi yang diperbarui di Aplikasi kami.",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
