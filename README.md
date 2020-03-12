### Source control respository
https://github.com/jishan33/T1A2


Software Development Plan
--------------------------
The main purpose of building this app is to try to combine my coding knowledge and engineering background at an entry-level. Hopefully, I can extend this experience to further apply more complex coding concepts into the engineering field in the near future. 
I like the idea of using technology to ease people’s life and simultaneously providing a more environmental environment. Solar panel rebate is a great program to encourage people to use more sustainable energy to support a more independent and efficient lifestyle. Making the program process more accessible is a great way to promote the concept of combing technology and sustainable energy. 

This application will make the rebate process easier for users and managers as all the process can be completed in one terminal app. 

Users can check if they are eligible by answering a short questionnaire. Also, they can easily check whether all the files have been successfully uploaded. The rebate can be easily evaluated by simply provide postcode, kw and deeming year. 

The manager can easily arrange the lists of applicants and assign applicants to the appropriate lists as well as remove it.

Although the information for the solar panel rebates can be easily accessed online, the applying process sometimes can be hectic.

In order to reduce the difficulty of applying process. Transforming the long and bland list into a more interactive questionnaire might increase the number of potential applicants. 

Also, providing the rebate assessment and the eligibility check on the same platform encourages the potential applicants to go through the process. Allocating the rebate calculator at the beginning could potentially increase their interests in this rebate program.

The target audiences are the property owners with less than 180,000 households combined income who would like to install some solar panels on their properties.  

This terminal app is a comparably easy process for them to use. They probably would play around with this app to have some basic ideas about this rebate program. And further, apply it with the requi`red documents.

Three features description
----------------------------
### Check Rebate Eligability

The program will prompt the user with several yes/no questions. Based on the users response to these questions, the program will determine whether or not the user is eligable for the solar panel rebate program. The users answers will be put into an array and rules from the Victoria solar panel rebate information website (see references) will be used to determine eligability based on the users responses once all responses have been collected.

### Check Required Files
As part of the application process for the rebate, several documents need to be collected including proof of income, two forms of identification and a quote from an certified retailer. The application will prompt the user for a link to the above and assist in ensuring that the links provided are valid urls to a supported file type (pdf or doc file). In the case of the quote, the domain of the url is used to check that the quote comes from a retail from the CEC (Clean Energy Council) approved solar retailers (see references) in Victoria. During this process, the user can also opt to exit the program at any time by providing a '0' as a response.

### Calculate Solar Panel Rebate
Finally, the program will prompt the user for the details of their solar installation and postcode. Based on this information, it will apply the Small-scale Technology Certificates (STC) equation (see references) in order to determine the number of STC's for the installation. The program will then multiply this number by the current market value of STC's at the time of implementation (see references).

Once this calculation has been completed, the program will display the results to the user and exit.





 Outline of the user interaction and experience 
----------------------------
The user will be interactively guided through each feature of the program on program launch.

Initially, some instructions are displayed to the user to prime them as to what to expect from the program.

After this, each feature of the program guides the user by prompting them for the required information as needed. The results are then printed to the terminal.

If the program encounters any errors during this process (ie, invalid user input), the program will restate the input requirements and prompt the user to input again.




Implementation Plan
----------------------------

Please refer to my [Trello board](https://trello.com/b/QiHS8LxP/t1a2)



Requirements
---
  - Ruby
  - Bundler

Installation
----

 - Clone the repository
 - Run bundle install



Usage
---
Run `./bin/jishan_solar_rebate`


This is a command line application rather than a library so no need to add anything to your Gemfile.

Script to run the application has been included in the `bin` directory for ease of use.

After running the application, you will be provided with instructions.


Reference
---------------------
  Victoria solar panel rebate information
  https://www.solar.vic.gov.au/solar-panel-rebate

  Postsode ratings for photovoltaic systems 
  http://www.cleanenergyregulator.gov.au/DocumentAssets/Documents/Postcode%20zone%20ratings%20and%20postcode%20zones%20for%20solar%20panel%20systems.pdf  

  STCs (Small_scale Technology Certificates) equation 
  http://www.solazone.com.au/solar-power/off-grid-solar-power/calculating-stcs/

  CEC (Clean Energy Council) approved solar retailers in Australia
  https://www.greenwire.com.au/clean-energy-council-approved-solar-retailers/

  STCs current market value
  https://www.tradeingreen.com.au/prices-93.html

  