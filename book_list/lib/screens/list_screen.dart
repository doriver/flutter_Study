import 'package:book_list/models/book.dart';
import 'package:book_list/repositories/book_repository.dart';
import 'package:book_list/screens/detail_screen.dart';
import 'package:book_list/screens/detail_screen_stateful.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {

  final List<Book> books = BookRepository().getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('도서 목록'), backgroundColor: Colors.cyan),
      body: ListView.builder( // 리스트뷰를 동적으로 구성, 대량의 데이터나 동적으로 변경되는 데이터 목록을 효율적으로 표시
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookTitle(book: books[index]);
        }
      )
    );
  }
}

class BookTitle extends StatelessWidget {
  final Book book;
  BookTitle({required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: Image.network(book.image),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detail(book: book)
          )
        );
      }
    );
  }
}