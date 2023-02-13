Introduction
The project under consideration is a mobile application created using Flutter, an open-source framework for building high-performance, high-fidelity, apps for iOS and Android. This app is a news aggregator that retrieves news articles from a RESTful API and displays them in a list. The project makes use of the BLoC (Business Logic Component) architecture pattern, which is a popular approach for managing state and data flow in Flutter applications.

Project Structure
The project consists of the following main components:

main.dart: The entry point of the app that defines the basic structure of the app.
bloc directory: Contains the BLoC classes that manage the state and data flow of the app.
data directory: Contains classes for handling network requests and parsing data from the API.
models directory: Contains classes that define the structure of the data objects used in the app.
ui directory: Contains the widgets that define the visual elements of the app.
API Used
The API used in this project is the News API, which provides access to news headlines, articles, and sources from a large range of sources. The API endpoint used to retrieve news articles is https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=<api_key>, where <api_key> is the API key required to access the News API. The API returns data in JSON format, which is then parsed and used to display the news articles in the app.

Conclusion
In conclusion, the project is a well-structured and efficient implementation of a news aggregator app using Flutter and the BLoC architecture pattern. The app demonstrates a practical use of network requests and JSON data parsing, and serves as a good example of a Flutter app that follows best practices.
 <a href="https://wakatime.com/badge/user/a6fde574-3cbb-4d4d-a769-19a48e2aaf9e/project/52af7c82-7835-4160-bbbd-26deb0a4d3cb"><img src="https://wakatime.com/badge/user/a6fde574-3cbb-4d4d-a769-19a48e2aaf9e/project/52af7c82-7835-4160-bbbd-26deb0a4d3cb.svg"></a>

A new Flutter project.



This project get data from api NEWs api using Bloc

![Group 14](https://user-images.githubusercontent.com/58498461/216411306-744ae631-ce3c-48a5-b6ac-fd6f06a775e1.png)


https://user-images.githubusercontent.com/58498461/216243190-ba51f1f2-c16c-4033-b077-9eb9d33b81b0.mp4


![screencapture-wakatime-projects-new-app-bloc-2023-02-02-21_54_07](https://user-images.githubusercontent.com/58498461/216439629-1d9a65af-99a2-4b73-8958-6b5e7e68aaaa.png)
