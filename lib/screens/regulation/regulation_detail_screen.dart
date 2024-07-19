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
              controller.regulation.title,
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              controller.regulation.document,
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
              InformationWidget(regulation: controller.regulation),
              const SizedBox(height: 20),
              Text(
                "Hubungan Antar Peraturan",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Cek melalui alamat url diatas.",
                style: PSTypography.regular,
              ),
              const SizedBox(height: 20),
              Text(
                "Dasar Hukum",
                style: PSTypography.semibold.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Cek melalui alamat url diatas.",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.description),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            controller.regulation.pdfUrl.replaceAll(
                              "https://peraturan.go.id/files/",
                              '',
                            ),
                            style: PSTypography.regular,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse(controller.regulation.pdfUrl),
                      ),
                      child: const Icon(Icons.download),
                    )
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
    required this.regulation,
  });

  final RegulationModel regulation;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoKeyValueWidget(
            keyText: "Jenis",
            value: regulation.regulation.toUpperCase(),
          ),
          const Divider(),
          InfoKeyValueWidget(
            keyText: "Dokumen",
            value: regulation.document,
          ),
          const Divider(),
          InfoKeyValueWidget(
            keyText: "Tahun",
            value: regulation.year,
          ),
          const Divider(),
          InfoKeyValueWidget(
            keyText: "Pemrakarsa",
            value: regulation.initiator,
          ),
          const Divider(),
          InfoKeyValueWidget(
            keyText: "Alamat",
            value: regulation.url,
            isLink: true,
            onTap: () => launchUrl(Uri.parse(regulation.url)),
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
    this.onTap,
  });

  final String keyText;
  final String value;
  final bool? isLink;
  final Function()? onTap;

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
          child: GestureDetector(
            onTap: onTap,
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
          ),
        )
      ],
    );
  }
}
