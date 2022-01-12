 A privacy respecting self-hosted NFT bookmark management solution.

Built using [Quasar v2](https://quasar.dev/) (Vue 3) and [supabase](https://supabase.io).

![Version Alpha](https://img.shields.io/badge/version-what's%20before%20alpha-red)

![Build](https://img.shields.io/badge/build-cross%20your%20fingers-orange)

## Screenshots

![App Screenshot](https://gpqfizmipddyuclajzop.supabase.in/storage/v1/object/public/avatars/11.png)

## Features

- [x] User login/registration
- [x] Light/dark mode
- [x] Bookmarks
  - [x] Set favourites
  - [x] Card view
    - [x] Card resizing
  - [ ] Edit bookmark data
    - [ ] Refetch site & metadata
    - [ ] Select image
    - [ ] Upload own image
    - [ ] Screenshot page
  - [ ] List view
  - [x] Fetch site contents
    - [x] Extract metadata
    - [ ] Local archive
    - [ ] Monitor for changes
  - [ ] Import from browser
- [x] Bookmark folders
  - [x] Customize folder icons
  - [x] Rearrange folders
  - [ ] Nested folders
  - [ ] Folder categories
- [ ] Browser extension
  - I want this to be as barebones as possible e.g., a button that saves bookmark onclick
- [ ] iOS/Android/Mac OS/Windows/Linux apps

## Development

```bash
git clone  https://github.com/AndrianBalanescu/NFT-Bookmark-Portfolio-Quasar-And-Supabase


 
```

### Frontend

```bash
cd frontend
yarn
quasar dev
```

### Backend

```bash
cd supabase
docker compose up
```
