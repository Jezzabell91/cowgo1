# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
User.reset_pk_sequence
Job.destroy_all
Job.reset_pk_sequence
Address.destroy_all
Address.reset_pk_sequence

users = [
    {
        first_name: "Butters", 
        last_name: "Stotch", 
        email: "bstotch@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        livestock_owner_role: "true", 
        company: "Butter's Beef", 
        website: "buttersbeef.fake", 
        description: "Mom, Dad, I Love You. Please Don’t Sell Me To Paris Hilton."
    },
    {
        first_name: "Stan", 
        last_name: "Marsh", 
        email: "smarsh@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        livestock_owner_role: "true", 
        company: "Stan's Steaks", 
        website: "stanssteaks.fake", 
        description: "In America, If Something Sucks, You're Supposed To Be Able To Get Your Money Back!"
    },
    {
        first_name: "Kyle", 
        last_name: "Broflovski", 
        email: "kbroflovski@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        livestock_owner_role: "true", 
        company: "Kyle's Cows", 
        website: "kylescows.fake", 
        description: "All animals kill, and the animals that don't kill are stupid ones like cows and turtles and stuff."
    },
    {
        first_name: "Eric", 
        last_name: "Cartman", 
        email: "ecartman@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        transporter_role: "true", 
        company: "Cartman's Chilli", 
        website: "cartmanschilli.fake",
        capacity: 25000,
        range: 3000,
        description: "I'm not fat, I'm festively plump!"
    },    
    {
        first_name: "Kenny", 
        last_name: "McCormick", 
        email: "kmccormick@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        transporter_role: "true", 
        company: "Kenny's Clubhouse", 
        website: "kennysclubhouse.fake",
        capacity: 10000,
        range: 3500,
        description: "At the dawn of war, I stand alone, looking out at what would be the last battlefield, for winter is coming and I am a princess..."
    },
    {
        first_name: "Token", 
        last_name: "Black", 
        email: "tblack@test.com", 
        password: "123456", 
        password_confirmation: "123456", 
        transporter_role: "true", 
        company: "Token's Ranch", 
        website: "tokensranch.fake",
        capacity: 30000,
        range: 2000, 
        description: "Please God, send more rich kids to my town..."
    }
]

    User.create(users)

    User.find(1).addresses.create(street_number: '84', street_name: 'Falls Creek Road', state: 'QLD', postcode: '4574', country: "Australia")
    User.find(2).addresses.create(street_number: '145', street_name: 'Wagoo Road', state: 'QLD', postcode: '4487', country: "Australia")
    User.find(3).addresses.create(street_number: '11', street_name: 'Jackson Street', state: 'NSW', postcode: '2711', country: "Australia")
    User.find(4).addresses.create(street_number: '9', street_name: 'Culgoa Street', state: 'NSW', postcode: '2840', country: "Australia")
    User.find(5).addresses.create(street_number: '26', street_name: 'Gordon Street', state: 'VIC', postcode: '3537', country: "Australia")
    User.find(6).addresses.create(street_number: '261', street_name: 'Carinda Road', state: 'NSW', postcode: '2829', country: "Australia")

    User.find(1).jobs.create(head: 25, weight: 12200, instructions: 'I need to relocate my herd of herefords')
    User.find(1).jobs.create(head: 8, weight: 3020, instructions: 'I bought eight charloais heifers and I need them brought to my farm')
    User.find(1).jobs.create(head: 45, weight: 28000, instructions: 'Help me turn these angus steers into beef')
    User.find(2).jobs.create(head: 2, weight: 240, instructions: 'Can you assist me in getting two cute highland calves home')
    User.find(2).jobs.create(head: 12, weight: 4300, instructions: 'I just sold these dairy shorthorns to a buyer and we need someone to provide transport')
    User.find(3).jobs.create(head: 28, weight: 22000, instructions: 'I purchased a herd of charbrays and need them brought to me')

    Job.find(1).addresses.create(street_number: '45', street_name: 'Town Common Road', state: 'QLD', postcode: '4390', country: "Australia")
    Job.find(1).addresses.create(street_number: '84', street_name: 'Falls Creek Road', state: 'QLD', postcode: '4574', country: "Australia")

    Job.find(2).addresses.create(street_number: '495', street_name: 'Backmede Road', state: 'NSW', postcode: '2470', country: "Australia")
    Job.find(2).addresses.create(street_number: '84', street_name: 'Falls Creek Road', state: 'QLD', postcode: '4574', country: "Australia")

    Job.find(3).addresses.create(street_number: '512', street_name: 'Kildonan Road', state: 'QLD', postcode: '4390', country: "Australia")
    Job.find(3).addresses.create(street_number: '14', street_name: 'Swanfels Road', state: 'QLD', postcode: '4371', country: "Australia")

    Job.find(4).addresses.create(street_number: 'Lot 13', street_name: 'Macquarie Drive', state: 'QLD', postcode: '4365', country: "Australia")
    Job.find(4).addresses.create(street_number: '145', street_name: 'Wagoo Road', state: 'QLD', postcode: '4487', country: "Australia")

    Job.find(5).addresses.create(street_number: '145', street_name: 'Wagoo Road', state: 'QLD', postcode: '4487', country: "Australia")
    Job.find(5).addresses.create(street_number: '284', street_name: 'Condamine Meandarra Road', state: 'QLD', postcode: '4416', country: "Australia")
    
    Job.find(6).addresses.create(street_number: '84', street_name: 'Falls Creek Road', state: 'QLD', postcode: '4574', country: "Australia")
    Job.find(6).addresses.create(street_number: '11', street_name: 'Jackson Street', state: 'NSW', postcode: '2711', country: "Australia")


    Job.last.addresses.create(street_number: '84', street_name: 'Falls Creek Road', state: 'QLD', postcode: '4574', country: "Australia")
    Job.last.addresses.create(street_number: '11', street_name: 'Jackson Street', state: 'NSW', postcode: '2711', country: "Australia")