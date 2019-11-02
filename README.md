# Sailing-Team-Iventory-System
SaaS inventory tracker for the Texas A&amp;M Sailing Team

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```
Docker
```

### Installing

A step by step series of examples that tell you how to get a development env running

Use the Dockerfile to build the image

```
docker build -f Dockerfile -t profane:latest .
```

Create a container with the repo mounted and a port opened for local testing.
Fill in <BLANK> where appropriate. Exit out of the container, find the container-id
and use that to log back into the container

```
docker run -it -v <path_to>/Sailing-Team-Iventory-System:/Sailing-Team-Iventory-System -p 3000:3000 profane:latest
exit
docker ps -a | grep profane 
docker start <container-id>
docker exec -it <container-id> bash
```

Navigate to the repo in the container and run...
```
bundle install --without production
rake db:migrate
rake db:seed
rails s -p 3000 -b 0.0.0.0
```

Go to [localhost](http://localhost:3000) to see the site

## Running the tests

Explain how to run the automated tests for this system

```
rake db:migrate RAILS_ENV=test
rspec
```

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

```
$ ssh-keygen -t rsa
$ heroku login
$ heroku keys:add
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku run rake db:seed
$ heroku open
```

## Built With

* [Rails](https://rubyonrails.org/) - The backend-web framework used

## Authors

* **Jadie Marshall** - *Contribution goes here* - [jmar016](https://github.com/jmar016)
* **Murtaza Hakimi** - *Contribution goes here* - [MRTZA](https://github.com/MRTZA)
* **Eric Zhang** - *Contribution goes here* - [esotericzhang](https://github.com/esotericzhang)
* **Nicolas Kristiansson** - *Contribution goes here* - [Norphesius](https://github.com/Norphesius)
* **Trent Thompson** - *Contribution goes here* - [PurpleBooth](https://github.com/PurpleBooth)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc


