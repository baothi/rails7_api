# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Book.create([
  { first_name: 'Book title 1',
    last_name: 'Book author 1',
    age: 10,
  },
  { title: 'Article title 2',
    last_name: 'Article author 2',
    age: 10,
  },
  { title: 'Article title 3',
    last_name: 'Article author 3',
    age: 10,
  }
])

Book.create([
  { title: 'Book title 1',
    author_id: 1,
  },
  { title: 'Article title 2',
    author_id: 2,
  },
  { title: 'Article title 3',
    author_id: 3,
  }
])
