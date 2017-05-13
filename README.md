# TutorialAcademy
A **DISCONTINUED** booking, scheduling and payment service for connecting students and tutors in Perth. You can view the site at:
* [tutorial-academy.herokuapp.com](https://tutorial-academy.herokuapp.com)
* And if still registered: [tutorial.academy](https://tutorial.academy/) and [tutorialacademy.com.au](https://tutorialacademy.com.au/)

Code moved to this public repo as of 9/10/2016 due to a lack of interest in continuing the project

## Installation
* `docker-compose build`
* `docker-compose up -d`
* container port forwarded to port 8080 -> localhost:8080 to view the app

### Restart
* `docker-compose restart app`

### Components
* Hosting through Heroku
* Payments handled through Braintree
* Images were uploaded to amazon s3 (bucket discontinued)
* Figaro gem for managing environment key/value pairs

* Ruby Version = 2.2.2, Rails = 4.2.2

### Database
##### PGSQL
* `docker-compose run --rm app rake db:create db:migrate`
* `docker-compose run --rm app rake db:seed` - for test data

### Env variables
Refer to *./config/app_example.yml* for an overview of the environment variables used in this project

## Known issues
* Logins have been disabled for the hosted site.
* Many basic styling issues

There are other undiscovered bugs floating around
