### Source control respository
https://github.com/jishan33/T1A2


Software Development Plan
--------------------------
This application will make the solar panel rebate process easier for users and managers as the whole process can be completed in one terminal app. 

Users can check if they are eligible by answering a short questionnaire. Also, they can easily check whether all the files have been successfully uploaded and are of the correct type. The rebate can be easily evaluated by simply provide postcode, kw and deeming year. 

The manager can easily arrange the lists of applicants and assign applicants to the appropriate lists as well as remove them.

Although the information for the solar panel rebates can be easily accessed online, the application process sometimes can be difficult.

In order to reduce the difficulty of the application process, transforming the long and bland list into a more interactive questionnaire might increase the number of potential applicants. 

Also, providing the rebate assessment and the eligibility check on the same platform encourages the potential applicants to go through the process. Allocating the rebate calculator at the beginning and at the end could potentially increase their interests in this rebate program.

The target audiences are the property owners with less than 180,000 household income combined income who would like to install some solar panels on their properties.  

This terminal app is a comparably easy process for them to use. They probably would play around with this app to have some basic ideas about this rebate program. And further, apply for it with the required documents.

### Functions to be implemented:
- `instruction (eligibility check)`
    - This function can kick off the application by presenting the user with a description of how to use the program and kick off the initial sequence of questions.
    
- `eligibility_response`
    - This function will be called to asses the answers provided by the user and determine whether or not they are eligible and inform them
- `answer_check`
    - There will be many questions with the same yes/no/exit response, therefore it makes sense to implement an answer check method to avoid duplicating code for each question. This function can take in the answer provided by the user and add to the list of ineligable answers / exit the program / prompt for the next question as appropriate.
- `valid_file_check`
    - The user will be prompted to submit several different files with similar requirements. As such, it makes sense to create a method that has common validation rules and ensures that the user provides a correct file in each case.
- `stc_postcode_rating`
    - Reads in a csv which lists postcode ranges as their respective STC ratings to be used later in the rebate function. This data is then used to determine the STC rating based on the users postcode. 
- `rebate`
    - Once the user has determined their eligibility and provided the details of their solar panel installation and location, the rebate method is used to calculate the approximate amount of rebate the user would be eligible to receive under the scheme.


Three features description
----------------------------
### Check Rebate Eligibility

The program will prompt the user with several yes/no questions. Based on the users’ response to these questions, the program will determine whether or not the user is eligible for the solar panel rebate program. The users’ answers will be put into an array and rules from the Victoria solar panel rebate information website (see references) will be used to determine eligibility based on the users’ responses once all responses have been collected.

### Check Required Files
As part of the application process for the rebate, several documents need to be collected including proof of income, two forms of identification and a quote from a certified retailer. The application will prompt the user for a link to the above and assist in ensuring that the links provided are valid URLs to a supported file type (pdf or doc file). In the case of the quote, the domain of the URL is used to check that the quote comes from a retailer from the CEC (Clean Energy Council) approved solar retailers (see references) in Victoria. During this process, the user can also opt to exit the program at any time by providing a '0' as a response.

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

![control-flow-digram](/home/jishan/Desktop/coder-academy/JishanLu_T1A2/docs/control-flow-digram.svg)


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


This is a command-line application rather than a library so no need to add anything to your Gemfile.

Script to run the application has been included in the `bin` directory for ease of use.

After running the application, you will be provided with instructions.


Reference
---------------------
 Victoria solar panel rebate information
https://www.solar.vic.gov.au/solar-panel-rebate

 Postcode ratings for photovoltaic systems 
http://www.cleanenergyregulator.gov.au/DocumentAssets/Documents/Postcode%20zone%20ratings%20and%20postcode%20zones%20for%20solar%20panel%20systems.pdf  

  STCs (Small_scale Technology Certificates) equation  
http://www.solazone.com.au/solar-power/off-grid-solar-power/calculating-stcs/

 CEC (Clean Energy Council) approved solar retailers in Australia
https://www.greenwire.com.au/clean-energy-council-approved-solar-retailers/

 STCs current market value
https://www.tradeingreen.com.au/prices-93.html

  

