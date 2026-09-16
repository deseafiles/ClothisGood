# ClotheisGood

Your Personal Wardrobe for managing your personal clothes!

## User Story
- Authentication
    1. As a user, I can register an account.
    2. As a user, I can log in.
    3. As a user, I can log out.

- Wardrobe Management
    1. As a user, I can take a picture of a piece of clothing.
    2. As a user, I can upload an existing photo from my gallery.
    3. As a user, I can edit the information of a clothing item.
    4. As a user, I can delete a clothing item.
    5. As a user, I can organize clothing items into categories.
    6. As a user, I can search for clothing items. 

- Outfit Builder
    1. As a user, I can drag and drop clothing items to create an outfit.
    2. As a user, I can save an outfit.
    3. As a user, I can edit an existing outfit.
    4. As a user, I can preview an outfit before wearing it. 

- Statistics
   As a user, I can see my most frequently worn clothes. 

## Use Case
- Authentication
    - Register
    - Login
    - Logout
- Clothing
    - Add Clothing
    - Edit Clothing
    - Delete Clothing
    - View Clothing
    - View All Clothes
    - Search Clothing
    - Favorite Cloth
    - Assign clothing to category
- Categories
    - Create category
    - Rename category
    - Delete category
- Outfit
    - Create OOTD
    - Save OOTD
    - Delete OOTD
    - View OOTD
    - View All OOTD

## Use Case
- Authentication
    - Register
    - Login
    - Logout
- Clothing
    - Add Clothing
    - Edit Clothing
    - Delete Clothing
    - View Clothing
    - View All Clothes
    - Search Clothing
- Outfit
    - Create OOTD
    - Save OOTD
    - Delete OOTD
    - View OOTD
    - View All OOTD

## Data Model
User
---
id
username
email
password

Category
--------
id
name
desc (optional)
icon

Cloth
-----
id
name
image
isFavorite
categoryId
createdAt

Outfit
------
id
name
createdAt

OutfitItem
----------
outfitId
clothId
positionX
positionY
layer
rotation
scale

LEARN!!!
1. Camera
2. Image Storage
3. Local Database
4. Authentication
5. Drag & Drop UI
6. State Management
7. Offline-first architecture
