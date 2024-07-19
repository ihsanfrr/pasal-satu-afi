part of '../../screens.dart';

enum RegulationState { initial, loading, loaded, error }

class RegulationListController extends GetxController {
  final String baseUrl = "https://peraturan.go.id";
  String regulation = "uu";
  int page = 1;
  RegulationState state = RegulationState.initial;
  List<RegulationModel> regulations = [];

  @override
  void onInit() {
    super.onInit();
    regulation = Get.arguments;
    getWebsiteData();
  }

  Future<void> getWebsiteData() async {
    state = RegulationState.loading;

    Uri url = Uri.parse("https://peraturan.go.id/$regulation?page=$page");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final years = html
        .querySelectorAll(
            'div.col-md-12 > div.strip.grid > div.wrapper > a.wish_bt')
        .map((e) => e.innerHtml.trim())
        .toList();

    final initiators = html
        .querySelectorAll('div.score > span.loc_open')
        .map((e) => e.innerHtml.trim())
        .toList();

    final documents = html
        .querySelectorAll('div.col-md-12 > div.strip.grid > div.wrapper')
        .map((e) => e.querySelector('p')?.innerHtml.trim() ?? '')
        .toList();

    final titles = html
        .querySelectorAll('div.col-md-12 > div.strip.grid > div.wrapper')
        .map((e) => e.querySelector('p > a')?.innerHtml.trim() ?? '')
        .toList();

    final items =
        html.querySelectorAll('div.col-md-12 > div.strip.grid > div.wrapper');

    final tags = items.map((item) {
      final spans = item.querySelectorAll('span');
      if (spans.isEmpty) {
        return '';
      } else {
        return spans.map((span) => span.innerHtml.trim()).join(', ');
      }
    }).toList();

    final urls = html
        .querySelectorAll('div.col-md-12 > div.strip.grid > div.wrapper')
        .map((e) => e.querySelector('p > a')?.attributes['href'] ?? '')
        .toList();

    final pdfUrls = html
        .querySelectorAll('div.col-md-12 > div.strip.grid > ul')
        .map((e) => e.querySelector('li > a')?.attributes['href'] ?? '')
        .toList();

    debugPrint('years: ${years.length}');
    debugPrint('initiators: ${initiators.length}');
    debugPrint('documents: ${documents.length}');
    debugPrint('titles: ${titles.length}');
    debugPrint('tags: ${tags.length}');
    debugPrint('urls: ${urls.length}');
    debugPrint('pdfUrls: ${pdfUrls.length}');

    for (int i = 0; i < years.length; i++) {
      regulations.add(RegulationModel(
        regulation: regulation,
        year: years[i],
        initiator: initiators[i],
        document: documents[i],
        title: titles[i],
        tags: tags[i],
        url: "$baseUrl${urls[i]}",
        pdfUrl: "$baseUrl${pdfUrls[i]}",
      ));
    }
    update();
    state = RegulationState.loaded;
  }
}
