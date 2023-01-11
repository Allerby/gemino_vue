# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = {
  'Income': [
    'Income',
    'Interest',
    'Investments',
    'Salary',
    'Savings',
    'Transfer',
    'Bonus',
    'Rental income',
    'Bank fee',
    'Tax'
  ],
  'Leisure': [
    'Cinema',
    'Electronics',
    'Entertainment',
    'Gym',
    'Hobby',
    'Subscriptions',
    'Arts',
    'Music',
    'Books',
    'Sports',
    'Makeup',
    'Shopping',
    'Hair',
    'Spa and Massage',
    'Gifts',
    'Toys'
  ],
  'Food and Drink': [
    'Alcohol',
    'Coffee',
    'Dairy',
    'Groceries',
    'Takeaways',
    'Restaurants'
  ],
  'Lifestyle': [
    'Clothes',
    'Travel',
    'Transport',
    'Dentist',
    'Doctor',
    'Eye care',
    'Pharmacy',
    'Gas and Fuel',
    'Parking',
    'Car',
    'Accommodation',
    'Rental Car',
    'Vacation',
    'Uber',
    'Baby Supplies',
    'Babysitter and Daycare',
    'Laundry',
    'Pets'
  ],
  'Housing and Bills': [
    'Bills',
    'Electricity',
    'Internet',
    'Mortgage',
    'Home phone',
    'Renovations',
    'Rent',
    'Water',
    'Television',
    'Mobile phone',
    'Insurance',
    'Loan',
    'Student Loan',
    'Housing',
    'School tuition'
  ],
  'Uncategorised': [
    'Other'
  ]
}

categories.each do |parent_cat, sub_cats|
  parent = Category.create(name: parent_cat)
  sub_cats.each do |category|
    Category.create(
      name: category,
      parent_category_id: parent.id
    )
  end
end
