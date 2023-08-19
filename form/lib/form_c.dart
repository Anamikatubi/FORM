
enum Category { female, male }
enum SubCategory {Ms,Mr,Mrs}
enum SubCategory1 {Ms1,Mr1,Mrs1}

class Form {
  Form({
    required this.name,
    required this.age,
    required this.category,
  });
  final String name;
  final String age;
  final String category;
}
