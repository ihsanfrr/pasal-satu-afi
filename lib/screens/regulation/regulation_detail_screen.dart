part of '../screens.dart';

class RegulationDetailScreen extends GetView<RegulationDetailController> {
  const RegulationDetailScreen({super.key});

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Provinsi Daerah Istimewa Yogyakarta",
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Undang-Undang Nomor 2 Tahun 2024",
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const InformationWidget(),
              const SizedBox(height: 20),
              Text(
                "Hubungan Antar Peraturan",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Tidak ada hubungan antar peraturan.",
                style: PSTypography.regular,
              ),
              const SizedBox(height: 20),
              Text(
                "Dasar Hukum",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "1. Undang-Undang Nomor 1 Tahun 2024",
                style: PSTypography.regular,
              ),
              const SizedBox(height: 20),
              Text(
                "Dokumen",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.description),
                        SizedBox(width: 6),
                        Text(
                          "1. pp-no-1-tahun-2024.pdf",
                          style: PSTypography.regular,
                        ),
                      ],
                    ),
                    Icon(Icons.download)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoKeyValueWidget(
            keyText: "Jenis",
            value: "Peraturan Pemerintah",
          ),
          Divider(),
          InfoKeyValueWidget(
            keyText: "Dokumen",
            value: "Peraturan Pemerintah Nomor 1 Tahun 2024",
          ),
          Divider(),
          InfoKeyValueWidget(
            keyText: "Tahun",
            value: "2024",
          ),
          Divider(),
          InfoKeyValueWidget(
            keyText: "Pemrakarsa",
            value: "Pemerintah Pusat",
          ),
          Divider(),
          InfoKeyValueWidget(
            keyText: "Alamat",
            value: "https://peraturan.go.id/id/pp-no-1-tahun-2024",
            isLink: true,
          ),
        ],
      ),
    );
  }
}

class InfoKeyValueWidget extends StatelessWidget {
  const InfoKeyValueWidget({
    super.key,
    required this.keyText,
    required this.value,
    this.isLink,
  });

  final String keyText;
  final String value;
  final bool? isLink;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            keyText,
            style: PSTypography.semibold.copyWith(fontSize: 14),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: PSTypography.medium.copyWith(
              fontSize: 12,
              color: isLink != null && isLink!
                  ? PSColor.primary
                  : PSColor.secondary,
              decoration: isLink != null && isLink!
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
        )
      ],
    );
  }
}
