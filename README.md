# Find events

This is an application that shows information about events in your city, built with Flutter. This project makes use
of the [SeatGeek](https://platform.seatgeek.com) API to obtain event information from a city.

---

## Run application

Install dependencies

```bash
  flutter pub get
```

Launch your prefer iOS simulator or Android emulator

```bash
  flutter emulators --launch <emulator_id> 
```

Start the app

```bash
  flutter run
```

---

## Authentication

This application has an authentication screen, which pretends to emulate the flow behavior. To continue, you can enter any email and password, the main idea is to emulate the behavior.
For example, it's possible to log in with the following credentials:

```json
{
  "email": "a@test.com",
  "password": "12335"
}
```


| Android                                                                    | iOS                                                                    |
|----------------------------------------------------------------------------|------------------------------------------------------------------------|
| <img src="./screenshots/auth_page_android.png" alt="drawing" width="200"/> | <img src="./screenshots/auth_page_ios.png" alt="drawing" width="200"/> |

---

## Demo

| Android                                                          | iOS                                                          |
|------------------------------------------------------------------|--------------------------------------------------------------|
| <img src="./screenshots/android.gif" alt="drawing" width="200"/> | <img src="./screenshots/ios.gif" alt="drawing" width="200"/> |