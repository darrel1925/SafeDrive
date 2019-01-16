# SafeDrive
##### Drive Safer Now.
SafeDrive is an aplpication made to live in the dashboards of the cars of the future. It was designed to facilitate car to car communication while driving. If a user feels that the car behind them is using their high beams and/or tailgating them, the user can use the dashboard of their car to send messages through Twilio's API to the driver who is doing this. There is also authentication to check that the driver in question is actually using their high beams and/or tailgating them. This authentication uses machine learning and hardware.

In [this link](https://devpost.com/software/safedrive-5obqky), you will find the images of the initial designs and further details for our application!.<br />

If you decide to spend some time looking over the code, you will find multiple refernces to SmartCars API. Becasue the project was made over ther course of one day we the full implemtation of the API is unfinished at this time.


## Getting Started

You will need:  
1.) You will need to download the 'SafeDrive' repsitory<br />
2.) Download the [Xcode] (https://developer.apple.com/xcode/) from the app store if you would like to run the appplication in a simulator<br />
3.) In oder to recieve the full functionality of this application, you will need: <br /><br />
    - ACCOUNT_SID = "ACCOUNT_SID"<br />
    - AUTH_TOKEN = "AUTH_TOKEN"<br />
    - TWILIO_NUM = "TWILIO_NUM"<br />
    - PERSONAL_NUM = "PERSONAL_NUM"<br />
    Which can all be found once you create an account with [Twilio](https://Twilio.com/console)<br />
    - Your specific information will need to be included into the beinning 'Watch My Back.xcworkspace' View Controller<br /><br />
    
## Running The Program<br />

1.) You will need to navigate to you workspace in the SafeDrive folder to open the project<br />
	- For example, I would type in the URL 'http://localhost:5000'<br />
2.) Next you will simply need to select 'iPhone XS' as the simulator build<br />
3.) Lastly, you will need to hit the play button to run the simulator and experience the app!<br />

## Built With

* [Google Firebase](https://firebase.google.com/) - A development platform 
* [Twilio API](https://Twilio.com/console) - A  cloud communications platform
* [Swift](https://swift.org/blog/swift-4-0-released/) - Used write the functionallity of the application
* [Xcode](https://developer.apple.com/xcode/) - Used lay out and format the interface of the application
* [Alamofire](https://github.com/Alamofire/Alamofire) - A Swift-based HTTP networking library that assists in developers in making network requests


## Authors

* **Darrel Muonekwu** - *Swift/Xcode/Backend-Programming* - [Git](https://github.com/darrel1925) - [LinkedIn](https://www.linkedin.com/in/darrelmuonekwu/)
* **Michaela Poblete** - *Javascript/CSS design/Frontend-Programming* - [Git](https://github.com/mhpoblet?tab=repositories) - [LinkedIn](https://www.linkedin.com/in/michaela-poblete/)
* **Derek Lee** - Javascript/CSS design/Frontend-Programming - [LinkedIn](https://www.linkedin.com/in/derek-lee-tech/)
* **Muntaser Syed** - Machine Learning/Hardware Specialist - [LinkedIn](https://www.linkedin.com/in/muntasersyed/),<br />
See also the list of [contributors](https://github.com/ryanshuzzz/ottomotive/contributors) who participated in this project.

### Very Special Thanks To 
##### For helping to andwer all of our questions and guide us thoughout the project
* **Elizabeth (Lizzie) Siegle** - Developer Evangelist @ Twilio  [LinkedIn](https://www.linkedin.com/in/elsiegle/)
* **Lorman Lau** - Android Developer @ DisplayRide  [LinedIn](https://www.linkedin.com/in/lorman-lau-873b21b4/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* SB Hacks
* Twillio


