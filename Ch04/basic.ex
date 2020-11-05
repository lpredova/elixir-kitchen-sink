
# Those are modifier functions - returns same type of the data
String.upcase("a string")
String.capitalize("a string")

list = []
list = List.insert_at(list, 0, "Some string")
list = List.insert_at(list, -1, "First")

# Query functions - returns some piece of meta info about the data - different type
length(list)
