part of '../screens.dart';

class AboutDeveloperScreen extends StatelessWidget {
  const AboutDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Text(
          "Tentang Pengembang",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/pasalsatu-afi.appspot.com/o/pasal-satu%2Fabout.png?alt=media&token=76431109-b323-40a1-aeba-0d3b44a3cd8c',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "AFI Team terdiri dari sekelompok mahasiswa yang memiliki hasrat untuk menciptakan aplikasi yang bermanfaat dan mudah digunakan. Kami mengimplementasikan pengalaman dari perkuliahan untuk mengembangkan perangkat lunak dan kami berkomitmen untuk memberikan pengalaman terbaik bagi pengguna kami.",
                style: PSTypography.regular.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Anggota Tim:\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: "1. Andi Sugara P - UI UX Designer\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "2. Ihsan Fajar R - Mobile Developer\n",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "3. Fitria Widyani - AI Engineer",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Sumber Terbuka:\n",
                      style: PSTypography.bold.copyWith(
                        fontSize: 14,
                        color: PSColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: "• https://github.com/pasal-satu-afi",
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrl(
                              Uri.parse('https://github.com/pasal-satu-afi'),
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
