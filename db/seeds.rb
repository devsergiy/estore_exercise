# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'


file = File.read(File.join(Rails.root, "db/fixtures/products.json"))
products = JSON.parse(file)

products['products'].each do |product_hash|
  Product.create_with(product_hash).find_or_create_by(sku: product_hash['sku'])
end
