# db/seeds.rb

# Clear existing data
PlayerGame.delete_all
Description.delete_all
GamePosting.delete_all
Friend.delete_all
PlayerProfile.delete_all

# Create PlayerProfiles with hashed passwords
may = PlayerProfile.create(id: '1', username: 'may', password: '1', password_confirmation: '1', email: 'may@mail.com')
merty = PlayerProfile.create(id: '2', username: 'merty', password: 'password2', password_confirmation: 'password2', email: 'merty@mail.com')
kevin = PlayerProfile.create(id: '3', username: 'kevin', password: 'password3', password_confirmation: 'password3', email: 'kevin@mail.com')
crystal = PlayerProfile.create(id: '4', username: 'crystal', password: 'password4', password_confirmation: 'password4', email: 'crystal@mail.com')

# Create GamePostings with Descriptions
valorant = GamePosting.create(id: '1',title: 'Valorant')
description1 = Description.create(id: '1',genre: 'FPS', player_limit: 5, description_text: 'Valorant is a free-to-play first-person tactical hero shooter developed and published by Riot Games, for Windows. Teased under the codename Project A in October 2019, the game began a closed beta period with limited access on April 7, 2020, followed by a release on June 2, 2020.', 
description_title: 'LF Radiant Smurfs')
valorant.description = description1
valorant.save

baldur = GamePosting.create(id: '2',title: 'Baldur Gate 3')
description2 = Description.create(id: '2',genre: 'Role Playing', player_limit: 4, description_text: 'Baldurs Gate 3 is a role-playing game that is developed and published by Larian Studios for Microsoft Windows with plans to release on MacOS, Playstatioon 5, & XBox Series X/S. Baldurs Gate 3 is the third installment in the Baldurs Gate series and it is set in the DnD universe from Wizards of the Coast.', 
description_title: 'Need friends for chaotic run')
baldur.description = description2
baldur.save

minecraft = GamePosting.create(id: '3',title: 'Minecraft')
description3 = Description.create(id: '3',genre: 'Sandbox', player_limit: 30, description_text: 'Minecraft is a game where players place blocks and go on adventures. This includes anything from crafting simple items like containers or weapons, to building structures like houses, castles, and cities, or even making complex mechanical-devices', 
description_title: 'Cozy Minecraft Run')
minecraft.description = description3
minecraft.save

# Create Player Games (Many-to-Many Relationship)
PlayerGame.create(player_profile: may, game_posting: valorant)
PlayerGame.create(player_profile: merty, game_posting: minecraft)
PlayerGame.create(player_profile: kevin, game_posting: baldur)

# Create Friends
Friend.create(player_profile: may, friend: merty, invite_status: 'accepted')
Friend.create(player_profile: may, friend: kevin, invite_status: 'pending')
Friend.create(player_profile: merty, friend: kevin, invite_status: 'accepted')

# # Create Friendships
# Friendship.create(user: may, friend: merty, invite_status: 'accepted')
# Friendship.create(user: may, friend: kevin, invite_status: 'pending')
# Friendship.create(user: merty, friend: kevin, invite_status: 'accepted')

# Create Player Games
player_profile = PlayerProfile.first
game_posting = GamePosting.first

PlayerGame.create(player_profile: player_profile, game_posting: game_posting)


# Create more seed data as needed


puts 'Seeding completed!'
