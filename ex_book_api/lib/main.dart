import 'dart:convert';

import 'package:ex_book_api/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List books = [];
  String query = '';

  Future<void> fetchBooks() async {
    final response = await http.get(
      Uri.parse('http://localhost:8091/api/books'),
    );
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body);
        print(books);
      });
    }
  }

  Future<void> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse('http://localhost:8091/api/books/search?title=$query'),
    );
    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Book List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: BookSearchDelegate(searchBooks),
              );
              if (result != null) {
                searchBooks(result);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book['title']),
            subtitle: Text(book['author']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookId: book['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final int bookId;

  const BookDetailPage({super.key, required this.bookId});

  Future<Map<String, dynamic>> fetchBookDetail() async {
    final response = await http.get(
      Uri.parse('http://localhost:8091/api/books/$bookId'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load book details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchBookDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final book = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${book['title']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Author: ${book['author']}'),
                  Text('Publisher: ${book['publisher']}'),
                  Text('Price: \$${book['price']}'),
                  const SizedBox(height: 16),
                  Text('Info: ${book['info']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class BookSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  BookSearchDelegate(this.onSearch);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    close(context, query);
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Enter a book title to search'));
  }
}


/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const BookListPage(),
    );
  }
}

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book> books = []; // 타입 수정
  String query = "";

  Future<void> fetchBooks() async {
    final response = await http.get(
      Uri.parse("http://localhost:8090/api/books"),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        books = jsonList.map((json) => Book.fromJson(json)).toList();
      });
    }
  }

  Future<void> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse("http://localhost:8090/api/search?title=$query"), // URL 수정
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        books = jsonList
            .map((json) => Book.fromJson(json))
            .toList(); // Book 객체로 변환
      });
    }
  }

  @override
  void initState() {
    // Future 제거
    super.initState();
    fetchBooks(); // 올바른 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Book List"),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: BookSearchDelegate(searchBooks),
              );

              if (result != null) {
                searchBooks(result);
              }
            },
          ),
        ],
      ),
      body: books.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("도서를 불러오는 중..."),
                ],
              ),
            )
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        book.title.isNotEmpty ? book.title[0] : 'B',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(book.title),
                    subtitle: Text("저자: ${book.writer}"),
                    trailing: Text(
                      "${book.price.toStringAsFixed(0)}원",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(book: book), // 수정
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

// 상세보기 페이지 (올바른 클래스명)
class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text("Book Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDetailRow("ID", book.bid?.toString() ?? "없음"),
                _buildDetailRow("저자", book.writer),
                _buildDetailRow("출판사", book.publisher),
                _buildDetailRow("가격", "${book.price.toStringAsFixed(0)}원"),
                const SizedBox(height: 16),
                const Text(
                  "상세정보:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  book.info.isNotEmpty ? book.info : "상세정보가 없습니다.",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// 검색 델리게이트 완성
class BookSearchDelegate extends SearchDelegate {
  final Function(String) onSearch;

  BookSearchDelegate(this.onSearch);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('"$query" 검색 결과', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              close(context, query);
            },
            child: const Text('검색하기'),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ['자바', '스프링', '클린코드', '리팩터링', '모던자바'];

    List<String> filteredSuggestions = suggestions
        .where(
          (suggestion) =>
              suggestion.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(filteredSuggestions[index]),
          onTap: () {
            query = filteredSuggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
*/