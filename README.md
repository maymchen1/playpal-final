# README
PlayPal

PlayPal is an app designed to allow gamers to connect with other gamers around the world who are interested in playing the same multiplayer games, but cannot find people to play with. 

The app is designed as a safer and more reliable way for gamers to find and connect with one another.

The app will feature an account creation option which will send confirmation emails after an account is created. Players will also be able to create postings where they look for a certain number of other gamers for a specific game. 

PlayPal meets the following Phase 5 Project Minimum Requirements:

Include a many to many relationship.

Between Player Profile and Game Posting 

Implement a minimum of 4 models.

Player Profile 
    id PK
    username
    email
    password
Friends
    id PK
    player_profile_id FK
    invite_status
Player Games
    player_profile_id FK
    game_posting_id FK
Game Posting 
    id PK
    title
Description 
    id PK
    game_posting_id FK
    player_limit
    genre
    description_text
    description_title

Implement a minimum of 5 client side routes using React router.
Implement password protection and authentication.
Include full CRUD on at least 1 model, following REST conventions. 

Player Profile 
Game Posting 

Implement validations and error handling.
Implement something new not taught in the curriculum. (Check in with your instructor to ensure the scope of your idea is appropriate.)

Email Confirmation 

Implement useContext or Redux.

useContext

* ...
