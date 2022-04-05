
p "Seeding started..."

p "1- Cleaning DB..."

Message.destroy_all
User.destroy_all
Channel.destroy_all

p "Cleaning done!"

p "1- Creating channels..."
Channel.create!(name: "general")
Channel.create!(name: "paris")
Channel.create!(name: "react")
p "#{Channel.count} #{"channel".pluralize(Channel.count)} created!"

p "2- Creating some users..."
User.create!(email: "nicolas.dgdl@hotmail.fr", password: "foobar", password_confirmation: "foobar")
User.create!(email: "john@doe.com", password: "foobar", password_confirmation: "foobar")
User.create!(email: "jane@doe.com", password: "foobar", password_confirmation: "foobar")
p "#{User.count} #{"user".pluralize(User.count)} created!"


p "3- Creating some messages in channels..."
nico = User.first
john = User.second
jane = User.third

p "#general"
general = Channel.first
nico.messages.build(channel: general, content: "Hello everyone!").save!
john.messages.build(channel: general, content: "Hi :)").save!
jane.messages.build(channel: general, content: "Nice to meet you all!").save!
nico.messages.build(channel: general, content: "Let's try out the other channels").save!
p "#paris"
paris = Channel.second
john.messages.build(channel: paris, content: "First").save!
nico.messages.build(channel: paris, content: "Darn it!").save!
jane.messages.build(channel: paris, content: "Any good restaurant around the office?").save!
john.messages.build(channel: paris, content: "You should try Bangcock Street Food!").save!
p "#paris"
react = Channel.third
jane.messages.build(channel: react, content: "Finished my first app!").save!
jane.messages.build(channel: react, content: "React is a lot of fun :)").save!
nico.messages.build(channel: react, content: "I know, right?!").save!
nico.messages.build(channel: react, content: "Struggled a bit with redux but now it's fine").save!
john.messages.build(channel: react, content: "What did you create?").save!

p "#{Message.count} #{"message".pluralize(Message.count)} created!"
