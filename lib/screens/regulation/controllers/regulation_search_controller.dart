part of '../../screens.dart';

enum RegulationSearchState { initial, loading, loaded, error }

class RegulationSearchController extends GetxController {
  final String baseUrl = "https://peraturan.go.id";
  RegulationSearchState state = RegulationSearchState.initial;
  List<RegulationModel> regulations = [];

  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  void searchRegulation() {
    if (searchController.text.isNotEmpty) {
      getWebsiteData(searchController.text);
    }
  }

  Future<void> getWebsiteData(String query) async {
    state = RegulationSearchState.loading;

    Uri url = Uri.parse(
        "https://peraturan.go.id/cariglobal?PeraturanSearch%5Bidglobal%5D=$query");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final regs = html
        .querySelectorAll(
            'div.col-md-12 > div.strip.grid > div.wrapper > a.float-right')
        .map((e) => e.innerHtml.trim())
        .toList();

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

    debugPrint('regulations: ${regs.length}');
    debugPrint('years: ${years.length}');
    debugPrint('initiators: ${initiators.length}');
    debugPrint('documents: ${documents.length}');
    debugPrint('titles: ${titles.length}');
    debugPrint('tags: ${tags.length}');
    debugPrint('urls: ${urls.length}');
    debugPrint('pdfUrls: ${pdfUrls.length}');

    for (int i = 0; i < years.length; i++) {
      regulations.add(RegulationModel(
        regulation: regs[i],
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
    state = RegulationSearchState.loaded;
  }
}
