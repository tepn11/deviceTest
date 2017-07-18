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

User.create(id: 2, email: "fr1@email.com")
User.create(id: 3, email: "fr2@email.com")
User.create(id: 4, email: "fr3@email.com")

connection = ActiveRecord::Base.connection()
connection.execute("INSERT INTO `friends` VALUES (1,1,2,NOW(),NOW()),(2,1,3,NOW(),NOW()),(3,2,4,NOW(),NOW())")
connection.execute("INSERT INTO `locations` VALUES 
	(1,1,'friends','-34.993347867812474,-4.197746834563588',NOW(),NOW()),
	(2,2,'friends','0.6741377302228386,-45.68160813386241',NOW(),NOW()),
	(3,2,'public','164.72835325191767,-0.4786835842554211',NOW(),NOW()),
	(4,3,'friends','178.0055745149055,-16.917913261064967',NOW(),NOW()),
	(5,4,'friends','-67.11264384097247,52.669441624147254',NOW(),NOW()),
	(6,4,'public','105.76367783475911,8.53194683029146',NOW(),NOW())")
