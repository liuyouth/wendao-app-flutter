

import 'package:flustars/flustars.dart';
import 'package:task/entity_factory.dart';

class ListRoot<T> {
  bool last;
  bool first;
  bool empty;
  List<T> content;
  num totalPages;
  num totalElements;
  num numberOfElements;
  num size;
  num number;

  ListRoot();

  ListRoot.all(this.last, this.first, this.empty, this.content, this.totalPages,
      this.totalElements, this.numberOfElements, this.size, this.number);
  ListRoot.fromJson(Map<String, dynamic> json) {
    last = json["last"];
    first = json["first"];
    empty = json["empty"];
    totalPages = json["totalPages"];
    totalElements = json["totalElements"];
    numberOfElements = json["numberOfElements"];
    size = json["size"];
    number = json["number"];

    if (json.containsKey("content")) {
      if (json["content"] is List) {
        content = [];
        (json["content"] as List).forEach((item) {
          content.add(EntityFactory.generateOBJ<T>(item));
        });
      } else {
        LogUtil.e(json["content"],
            tag: "fromJson: Wrong use of ListResult. Result should be used");
      }
    }
  }
  @override
  String toString() {
    return 'ListRoot{last: $last, first: $first, empty: $empty, content: $content, totalPages: $totalPages, totalElements: $totalElements, numberOfElements: $numberOfElements, size: $size, number: $number}';
  }
}
