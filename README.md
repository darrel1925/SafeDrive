# Ottomotive

Ottomotive is a mock sharing-economy company with a mission of empowering those who don't have access to cars with an opportunity to make an income! We used Smartcar's API to access information from smart cars to create the interface for a web application that would allow its users to grant other users access to their vehicle in order to drive or Uber, Lyft, or for another ridesharing or diving company, earning income for themselves as well as those who are renting out their cars. 

In [this link](https://sachacks.hackerearth.com/sprints/sachacks/dashboard/e94f6e2/submission/), you will find the initial designs for our webpage starting from the 4th picture onward.<br />

Unfortuanlety, this project was concieved and excuted in one night so our sebsite is NOT fully functioning at this time.


## Getting Started


You will need:  
1.) Download the 'Ottomotive' file from the repsitory<br />
2.) Download the [pythonsdkmaster](https://github.com/smartcar/python-sdk) from the Smartcar repsitory<br />
3.) Install PIP:  If you’re using Python 2.7.9 (or greater) or Python 3.4 (or greater), then PIP comes installed with Python by default. If you’re using an older version of Python, you’ll need to use the installation described in [this link](https://packaging.python.org/tutorials/installing-packages).<br /><br />
4.) Install tornado using pip your Command Line using the command:  
	```
    >>> pip install tornado
	```
	<br /><br />
5.) You will also need to know your <br />
    - Client ID<br />
    - Client Secret<br />
    - Redirect URIs<br />
    Which can all be found once you create an account with [Smartcar](https://smartcar.com/)<br />
    - Your specific information will need to be included into the beinning 'Ottmotive.py' file<br /><br />
6.) You will aslo need need to download Smartcar's [Python SDK](https://github.com/smartcar/python-sdk)<br /><br />
    
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

* [Tornado](https://www.tornadoweb.org/) - The web framework used
* [Python](https://www.python.org/) - Used to fetch vehicle information
* [smartcar](https://smartcar.com/) - Used to get all car ingo


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


