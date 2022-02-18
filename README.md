# Auction app

A simple flutter app that uses Firebase firestore as backend and Firebase Storage for storage purpose. User's can register and place their items for auction. Other users can bid on placed items.

_All feature implemented._

### Authentication

For now, users can only Sign up with Gmail. No additional settings is needed, just one tap.

### State Management

[Provider](https://pub.dev/packages/provider) is used for state management. Firebase uses streams for realtime data changes. It's a bit tricky and frustating to manage firebase states with provider. After spending a good number of hours I _kind of_ managed it. I created a provider with firebase stream function with firebase's utility and then passed it as StreamBuilder streams. StreamBuilder always listens the snapshots & if any changes happen in realtime, it updates. My implementation is not neat but for now it's get's the job done. In future I'll refactore with better layering and state management. I'm using firebase's own stream for checking authenticated user, for now.

### Folder Structure

I tried to achieve clean architecture with a data flow like below,

```
firebase -> api -> repository -> usecase -> provider -> screens
```

But with firebase stream and provider I couldn't get it right. Once the
features are completed, I'll refactore with proper layering.

### Routes

I used Generated Routes throughout the project. It's flexible, clean and passing arguments is neat.

### Used plugins

[random_string](https://pub.dev/packages/random_string) - Unique names for files. Used to generate names for images that I stored in firebase storage

[image_picker](https://pub.dev/packages/image_picker) - Used to pick image while uploading an item for auction.

[keyboard_dismisser](https://pub.dev/packages/keyboard_dismisser) - Handles gestures nicely. Used to unfocus keyboard on some selected gestures.

### Build

```
$ flutter build apk --release
```
