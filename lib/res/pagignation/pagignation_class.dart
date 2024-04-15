class Pagination {
  final int itemsPerPage;
  int currentPage;
  Pagination({this.itemsPerPage = 10, this.currentPage = 1});

  Future<void> nextPage() async {
    await Future.delayed(Duration(seconds: 2));
    currentPage++;
  }

  bool hasNextPage(List<dynamic> items) {
    return items.length >= currentPage * itemsPerPage;
  }
}
