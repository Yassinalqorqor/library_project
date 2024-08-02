
class BookModel {
  String? id;
  String? title;
  String? image;
  int? pages;
  String? author;
  String? language;
  String? publishedDate;
  String? description;
  String? webview;

  //BookModel(this.id,this.title,this.image,this.pages,this.author,this.language,this.publishedDate,this.description);

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['volumeInfo']['id'];
    title = json['volumeInfo']['title'] as String;
    image= json['volumeInfo']['imageLinks']['thumbnail']as String;
    author = json['volumeInfo']?['authors'] != null && (json['volumeInfo']['authors'] as List).isNotEmpty
        ? json['volumeInfo']['authors'][0] as String
        : 'Unknown';
    language =json['volumeInfo']['language'];
    pages = json['volumeInfo']?['pageCount'] ?? 0;
    description = json['volumeInfo']['description']??'';
    publishedDate = json['volumeInfo']['publishedDate']??'';
    webview=json['volumeInfo']['previewLink'];

  }


}



