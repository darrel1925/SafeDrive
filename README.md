# SafeDrive
##### Drive Safer Now.
SafeDrive is an aplpication made to live on the dashboards of the cars of the future. If a user feels that the car behind them is using their high beams and/or tailgating them, the user can use the dashboard of their car and/or their mobile device to send messages through Twilio's API to the driver who is doing this. There is also authentication to check that the driver in question is actually using their high beams and/or tailgating them. This authentication uses machine learning and hardware.

In [this link](https://devpost.com/software/safedrive-5obqky), you will find the images of the initial designs and further details for our application!.<br />

If you decide to spend some time looking over the code, you will find multiple refernces to SmartCars API. Becasue the project was made over ther course of one day we the full implemtation of the API is unfinished at this time.


## Getting Started


You will need:  
1.) You will need to download the 'SafeDrive' repsitory<br />
2.) Download the [Xcode] (https://developer.apple.com/xcode/) from the app store if you would like to run the appplication in a simulator<br />
3.) In oder to recieve the full functionality of this application, you will need: <br /><br />
    - ACCOUNT_SID = "ACCOUNT_SID"
    - AUTH_TOKEN = "AUTH_TOKEN"
    - TWILIO_NUM = "TWILIO_NUM"
    - PERSONAL_NUM = "PERSONAL_NUM"
    Which can all be found once you create an account with [Twilio](https://Twilio.com/console)<br />
    - Your specific information will need to be included into the beinning 'Watch My Back.xcworkspace' View Controller<br /><br />
    
### Installing
In your Command Line:<br />
1.) Navigate to the directoy where the file is saved:<br />
2.) Begin the program<br /><br />

For example, If I had saved both 'Ottomotive' and 'pythonsdkmaster' to my desktop, to begin the program I would run the command:

```
>>> cd '/Users/darrelm/Desktop/Ottomotive/'
>>> python run.py
```
## Running The Program<br />

1.) You will need to navigate to you default webbrowser and type in the you local host name<br />
	- For example, I would type in the URL 'http://localhost:5000'<br />
2.) You will be redireted to a page that asks if you allow Smartcar access to your (demo) vehicle's information<br />
3.) Assumung you click yes, you will be redirected to our Ottomitve webpage<br />

## Built With

* [Google Firebase](https://firebase.google.com/) - A development platform 
* [Twilio API](https://Twilio.com/console) - A  cloud communications platform
* [Swift](https://swift.org/blog/swift-4-0-released/) - Used write the functionallity of the application
* [Xcode](https://developer.apple.com/xcode/) - Used lay out and format the interface of the application
* [Alamofire](https://github.com/Alamofire/Alamofire) - A Swift-based HTTP networking library that assists in developers in making network requests


## Authors

* **Ryan Shu** - *Backend-Programming/html-programming* - [Git](https://github.com/ryanshuzzz)
* **Darrel Muonekwu** - *Backend-Programming/html-programming* - [Git](https://github.com/darrel1925)
* **Mylinh Pham** - *html design/Frontend-Programming* - [Git](https://github.com/darrel1925)
* **Scott Sanchez** - *Website-Design* -
See also the list of [contributors](https://github.com/ryanshuzzz/ottomotive/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* The Smartcar Team
* SacHacks


