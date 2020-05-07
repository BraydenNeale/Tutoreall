# TutorialAcademy
A **DISCONTINUED** booking, scheduling and payment service for connecting students and tutors in Perth. You can view the site at:
* [tutorial-academy.herokuapp.com](https://tutorial-academy.herokuapp.com)
* And if still registered: [tutorial.academy](https://tutorial.academy/) and [tutorialacademy.com.au](https://tutorialacademy.com.au/)

Code moved to this public repo as of 9/10/2016 due to a lack of interest in continuing the project

## Deployment
* `kubectl apply -f ./kubernetes/`
* `kubectl exec -it tutorialacademy-<POD_ID> -- /bin/bash`
* `rake db:create db:migrate db:seed` - from within tutorialacademy pod
* locahost:80 through docker-desktop

### Docker compose - legacy
* `docker-compose build`
* `docker-compose up -d`
* `docker-compose run --rm app rake db:create db:migrate`
* `docker-compose run --rm app rake db:seed` - for test data
* `docker-compose restart app` - To restart

### Components
* Hosting through Heroku
* Payments handled through Braintree
* Images were uploaded to amazon s3 (bucket discontinued)
* Figaro gem for managing environment key/value pairs
* Ruby Version = 2.2.2, Rails = 4.2.2

### Env variables
* Defined in ./kubernetes/app-config.yaml and ./kubernetes/db-config.yaml

## Known issues
* Logins have been disabled for the hosted site.
* Many basic styling issues
* Many known vulnerabilities due to old rails version and dependencies
