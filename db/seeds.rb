# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Book.create([
    { title: 'Book title 1',
      author: 'Book author 1'
    },
    { title: 'Article title 2',
      author: 'Article author 2'
    },
    { title: 'Article title 3',
      author: 'Article author 3'
    }
  ])