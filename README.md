# TutorialAcademy
A **DISCONTINUED** booking, scheduling and payment service for connecting students and tutors in Perth. You can view the site at:
* [tutorial-academy.herokuapp.com]
* And if still registered: [tutorial.academy] and [tutorialacademy.com.au]

Code moved to this public repo as of 9/10/2016 due to a lack of interest in continuing the project

## Installation
Installing this master branch is a pain... refer to [docker branch](https://github.com/BraydenNeale/tutorial_academy/tree/docker) for installing with docker-compose.

### Components
* Hosting through Heroku
* Payments handled through Braintree
* Images were uploaded to amazon s3 (bucket discontinued)
* Figaro gem for managin storing key/value pairs

* Ruby Version = 2.2.2, Rails = 4.2.2

### Database
##### PGSQL
* `rake db:create`
* `rake db:migrate`
* `rake db:seed` - for test data

## Known issues
* Logins have been disabled for the hosted site.
* Many basic styling issues

There are other undiscovered bugs floating around
