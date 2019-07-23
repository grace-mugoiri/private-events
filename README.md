# Ruby on Rails Event Schedular application

This is part of the Association Project in The Odin Project’s Ruby on Rails Curriculum. For more information click --> [Event Schedular Project]
(https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
$ rails db:seed
```

after that run the server from terminal in the root directory of the project

```
$ rails server
```
you can now open the localhost, sign up and create events. It is also possible to invite friends to events

 http://localhost:3000/

To check other users you can login using only their names.

Note: In this Project it is assumed that everyuser is friend with each other. Thats for the simplicity. The purpose is to create correct models and associations for users and events.


# Authors

* **Yunus Emre Aybey** - [YemreAybey](https://github.com/YemreAybey)
* **Grace Mugoiri** - [Grace](https://github.com/grace-mugoiri)
