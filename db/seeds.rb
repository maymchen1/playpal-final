# db/seeds.rb

# Clear existing data
PlayerGame.delete_all
Description.delete_all
GamePosting.delete_all
Friends.delete_all
PlayerProfile.delete_all

# Create PlayerProfiles
may = PlayerProfile.create(username: 'may', password: 'password1', email: 'may@mail.com')
merty = PlayerProfile.create(username: 'merty', password: 'password2', email: 'merty@mail.com')
kevin = PlayerProfile.create(username: 'kevin', password: 'password3', email: 'kevin@mail.com')
crystal = PlayerProfile.create(username: 'crystal', password: 'password3', email: 'crystal@mail.com')

# Create GamePostings with Descriptions
valorant = GamePosting.create(title: 'Valorant')
description1 = Description.create(genre: 'FPS', player_limit: 5, description_text: 'Valorant is a free-to-play first-person tactical hero shooter developed and published by Riot Games, for Windows. Teased under the codename Project A in October 2019, the game began a closed beta period with limited access on April 7, 2020, followed by a release on June 2, 2020.', 
description_title: 'LF Radiant Smurfs')
valorant.description = description1
valorant.save

baldur = GamePosting.create(title: 'Baldur Gate 3')
description2 = Description.create(genre: 'Role Playing', player_limit: 4, description_text: 'Baldurs Gate 3 is a role-playing game that is developed and published by Larian Studios for Microsoft Windows with plans to release on MacOS, Playstatioon 5, & XBox Series X/S. Baldurs Gate 3 is the third installment in the Baldurs Gate series and it is set in the DnD universe from Wizards of the Coast.', 
description_title: 'Need friends for chaotic run')
baldur.description = description2
baldur.save

minecraft = GamePosting.create(title: 'Minecraft')
description3 = Description.create(genre: 'Sandbox', player_limit: 30, description_text: 'Minecraft is a game where players place blocks and go on adventures. This includes anything from crafting simple items like containers or weapons, to building structures like houses, castles, and cities, or even making complex mechanical-devices', 
description_title: 'Cozy Minecraft Run')
minecraft.description = description3
minecraft.save

# Create Friends
Friends.create(player_profile: may, friend: merty, invite_status: 'accepted')
Friends.create(player_profile: may, friend: kevin, invite_status: 'pending')

# Create Player Games
player_profile = PlayerProfile.first
game_posting = GamePosting.first

PlayerGame.create(player_profile: player_profile, game_posting: game_posting)

# Create more seed data as needed


puts 'Seeding completed!'
