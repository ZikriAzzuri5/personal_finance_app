# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#

WalletType.where(id: 1, name:'Cash').first_or_create!
WalletType.where(id: 2, name:'Bank Account').first_or_create!
WalletType.where(id: 3, name:'Credit Card').first_or_create!
WalletType.where(id: 4, name:'Investation').first_or_create!
WalletType.where(id: 5, name:'E-Wallet').first_or_create!
WalletType.where(id: 6, name:'Others').first_or_create!

Currency.where(code:"IDR" , country_code: "ID").first_or_create!
Currency.where(code:"USD" , country_code: "US").first_or_create!

# TransactionType.where(id: 1, name: "Expense").first_or_create!
# TransactionType.where(id: 2, name: "Loan").first_or_create!
# TransactionType.where(id: 3, name: "Income").first_or_create!
# TransactionType.where(id: 4, name: "Lend").first_or_create!
# TransactionType.where(id: 5, name: "Transfer").first_or_create!
# TransactionType.where(id: 6, name: "Debt").first_or_create!

Contact.where(id: 1, name: 'Jamal', phone_number: '62812322495627').first_or_create!

# transactionType = { 2 => { "name" => "Loan" }, 6 => { "name" => "Adjustment" } }
# TransactionType.update(transactionType.keys, transactionType.values)

TransactionType.update(2, :name => 'Borrow')