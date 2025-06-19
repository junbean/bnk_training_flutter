class Book {
  final int bid;
  final String title;
  final String writer;
  final String publisher;
  final double price;
  final String info;

  Book({
    this.bid = 0, // 기본값 제공
    required this.title,
    this.writer = '', // 빈 문자열 기본값
    this.publisher = '',
    this.price = 0.0, // 0원 기본값
    this.info = '',
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bid: json['bid'] ?? 0,
      title: json['title'] ?? '',
      writer: json['writer'] ?? '',
      publisher: json['publisher'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      info: json['info'] ?? '',
    );
  }
}
