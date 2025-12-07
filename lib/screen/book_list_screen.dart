import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_list_item.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final List<Book> _initialBooks = [
    Book(
      title: 'Сто років самотності',
      author: 'Габріель Гарсіа Маркес',
      year: 1967,
    ),
    Book(title: '1984', author: 'Джордж Орвелл', year: 1949),
    Book(title: 'Зачарована Десна', author: 'Олександр Довженко', year: 1956),
    Book(title: 'Портрет Доріана Грея', author: 'Оскар Вайльд', year: 1890),
    Book(title: 'Майстер і Маргарита', author: 'Михайло Булгаков', year: 1967),
    Book(title: 'Кобзар', author: 'Тарас Шевченко', year: 1840),
    Book(title: 'Дюна', author: 'Френк Герберт', year: 1965),
  ];

  late List<Book> _books;

  @override
  void initState() {
    super.initState();
    _loadAndSortBooks();
  }

  void _loadAndSortBooks() {
    _books = List.from(_initialBooks);
    _books.sort((a, b) => a.year.compareTo(b.year));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бібліотека'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: _books.length,

        itemBuilder: (context, index) {
          final book = _books[index];
          return BookListItem(book: book);
        },

        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
          );
        },
      ),
    );
  }
}
