import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

// Annotate a Dart class to create a box
@Entity()
class Person {
  @Id() 
  int id;
  String name;

  Person({this.id = 0, required this.name});
}

final box = store.box<Person>();

// Put a new object into the box
var person = Person(name: "Joe Green");
final id = box.put(person);

// Get the object back from the box
person = box.get(id)!;

// Update the object
person.name = "Joe Black";
box.put(person);

// Query for objects
final query = box.query(Person_.name.equals("Joe Black"))
        .order(Person_.name).build();
final people = query.find();
query.close();

// Remove the object from the box
box.remove(person.id);