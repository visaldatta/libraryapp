# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users=User.create([
#	{1},}
	{
		{name:		 'Aniruddh Attili'},
  	{email:		 'aniattili@gmail.com'},
        {password:	 'password'},
        {admin: 	 1},
        {super: 	 1},
        {messages: 	 ''},
        {unread:         0},
	{created_at: 	'2016-09-23 18:18:00'},
	{updated_at: 	'2016-09-26 00:52:39'},
#	(2},
	{
		{name:		'daryl'},
	{email:		'daryl@ymail.com'},
	{password:	'password'},
	{admin: 	0},
	{super: 	0},
	{messages: 	''},
	{unread:      0},
	{created_at: 	'2016-09-23 19:07:18'},
	{updated_at: 	'2016-09-23 19:07:18'}
	},
	#(6},
	{
		{name:		'test'},
	{email:		'test@test.com'},
	{password:	'password'},
	{admin: 	NULL},
	{super: 	NULL},
	{messages: 	NULL},
	{unread:      NULL},
	{created_at: 	'2016-09-26 00:36:31'},
	{updated_at: 	'2016-09-26 00:36:31'}
	}
])

users=Room.create([
	{
	{room_number: '1001'},	
	{building:    'Hunt'},
	{size:        '4 seats'}
	},
	{
	{room_number: '1002'},	
	{building:    'Hunt'},
	{size:        '6 seats'}
	},
	{
	{room_number: '1003'},	
	{building:    'Hill'},
	{size:        '4 seats'}
	}
		 )]
