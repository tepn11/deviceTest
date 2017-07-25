# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Friend.delete_all
Location.delete_all

User.create(id: 1, email: "user@email.com", password: '123456')
User.create(id: 2, email: "fr1@email.com", password: '123456')
User.create(id: 3, email: "fr2@email.com", password: '123456')
User.create(id: 4, email: "fr3@email.com", password: '123456')

connection = ActiveRecord::Base.connection()
connection.execute("INSERT INTO `friends` VALUES (1,1,2,NOW(),NOW()),(2,1,3,NOW(),NOW()),(3,2,4,NOW(),NOW())")
connection.execute("INSERT INTO `locations` VALUES 
	(1,1,'Friends','137.8125,-21.94304553343818',NOW(),NOW()),
	(2,2,'Friends','20.39062499999998,18.312810846425435',NOW(),NOW()),
	(3,2,'Public','123.75,9.795677582829754',NOW(),NOW()),
	(4,3,'Friends','-80.85937500000001,36.3151251474805',NOW(),NOW()),
	(5,4,'Friends','-121.64062500000001,40.71395582628605',NOW(),NOW()),
	(6,4,'Public','105.76367783475911,8.53194683029146',NOW(),NOW())")
