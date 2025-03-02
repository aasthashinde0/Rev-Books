# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

author = Author.create(name:"Johny" , bio:"Motivational Speaker")

(1..5).each do |i|
    Book.create(title: "Book #{i}" , author_id: author.id , description: "Written 10 boks" , isbn: rand(100..200) )
end 