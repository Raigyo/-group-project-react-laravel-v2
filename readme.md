# Becode - Event Dab (Workgroup: Laravel + ReactJS)

![Becode logo](https://raw.githubusercontent.com/Raigyo/react-character-manager/master/img/becode-logo.png)

_March - April 2019 (edited April 2022)_

> 🔨 CRUD Application to manage events online. If you want to know how does it look like check it out on [Heroku](https://raigyo-event-dab.herokuapp.com/)

---

![capture](_img-readme/event-dab.png)

## Built With

-   [Laravel](https://laravel.com/docs/5.8) - PHP Framework
-   [React](https://reactjs.org/docs/getting-started.html) - JS Framework
-   [Postgresql](https://www.postgresql.org/docs/) - Database

## Authors

-   [**Julien Caramazza**](https://github.com/Jucara) _(Backend)_
-   [**Vincent Chilot**](https://github.com/Raigyo) _(Frontend)_
-   [**Michael Lambrechts**](https://github.com/MichaelLambrechts) _(Frontend)_
-   [**Thibaut Janssens**](https://github.com/ThibautJanssens) _(Full Stack)_

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Getting Started

### Prerequisites

You'll need [composer](https://getcomposer.org/doc/) and [npm](https://www.npmjs.com/get-npm) to download and install all the dependencies.

You need a PostgreSQL database, if you already have one, you can put your credentials in the .env file in the DB\_... section. If you do not have one, you can use [docker](https://www.docker.com/). The docker-compose.yml is given in the root directory.

### Installing

To get a development env running, install all the dependencies with:

```cmd
composer install && npm install

composer update
```

Don't forget to edit your .env file. If you do not have one:

```cmd
cp .env.example .env
```

And modify your credentials.
Then generate your jwt key and your app key

```cmd
php artisan key:generate
php artisan jwt:secret
```

If you don't have a PostgreSQL you can start the docker-compose.yml file is included up in the root directory

```cmd
docker-compose up
```

To start your PHP server use the command (_by default the server will start on localhost:8000_):

```cmd
php artisan serve
```

You can specify a port by using

```cmd
php artisan serve --port=8080
```

Or you can simply run the launchscript.sh with:

```cmd
./launchscript.sh
```

If it doesn't work, it probably means you have to set the right to execute it.

```cmd
sudo chmod +x launchscript.sh
```

## DB

### Init

`php artisan migrate`

### Reset

`php artisan migrate:fresh`

## Deployment

The project is ready to deploy on heroku, just push this repo to your herokuapp repository.
Add you addon for the database with the following :

```cmd
heroku addons:create heroku-postgresql:hobby-dev
```

Don't forget to edit the configs with:

-   APP_ENV = production
-   APP_KEY
-   APP_URL = your url
-   DB_CONNECTION = heroku
-   JWT_SECRET
-   MAIL_PASSWORD
-   MAIL_USERNAME

And finally run in the console of your heroku app:

```cmd
php artisan migrate:fresh
```

to set your database

## Documentation (API)

## Authentication

### POST /register

Only takes a JSON as input.

```json
{
    "name": "yourName",
    "email": "yourEmail",
    "password": "yourPassword"
}
```

Return your token.

### POST /login

Only takes a JSON as input.

```json
{
    "email": "yourEmail",
    "password": "yourPassword"
}
```

## Event

### Event object

-   _id_: The identifier of the event as an integer.
-   _name_: The name of the event.
-   _date_event_: The date of the event.
-   _author_: The identifier of the user that created the event.
-   _description_: A description of the event.
-   _reminder_: A date to know when to send a notification for all the participant at the event.
-   _image_url_: A link to the image that you want for the event.

For every route where you have to be logged in, you simply have to add to your request the following header:

```json
{
    "Content-Type": "application/json",
    "Authorization": "Bearer " + "your token"
}
```

### GET /events

Returns a complete list of all the events.

### GET /myEvents

_(must be logged)_
Returns a complete list of all the events you created.

### GET /myParticipation

_(must be logged)_
Returns a complete list of all the events you created.

### GET /pastEvent

Returns a complete list of all the events that are already finished.

### GET /futurEvent

Returns a complete list of all the events that are yet to come.

### GET /event/:id

Returns a event by id.

### PUT /event/:id

_(must be logged and the author of the event)_
Only takes JSON as input.

```json
{
    "name": "Name of event",
    "date_event": "YYYY-MM-DD HH:MM:SS",
    "description": "Your description",
    "reminder": "YYYY-MM-DD HH:MM:SS",
    "image_url": "url"
}
```

Updates a event.

### POST /event

_(must be logged)_
Only takes JSON as input.

```json
{
    "name": "Name of event",
    "date_event": "YYYY-MM-DD HH:MM:SS",
    "description": "Your description",
    "reminder": "YYYY-MM-DD HH:MM:SS",
    "image_url": "url"
}
```

Creates a new event.
Returns the newly created event id.

### POST /inscription/:id

_(must be logged)_
_(Id is the id of the event)_
Allows the user to subscribe to an event.

### POST unsubscribe/:id

_(must be logged)_
_(Id is the id of the event)_
Allow the user to unsubscribe to an event.

## Useful links

-   [How To Deploy Laravel Project On Heroku](https://appdividend.com/2022/03/01/how-to-deploy-laravel-project-on-heroku/)
-   [Getting Started with Heroku, Postgres and PgAdmin — RUN\_\_ON Part 2](https://medium.com/@vapurrmaid/getting-started-with-heroku-postgres-and-pgadmin-run-on-part-2-90d9499ed8fb)
-   [Laravel on Heroku - Using a PostgreSQL database](https://mattstauffer.com/blog/laravel-on-heroku-using-a-postgresql-database/)
-   [Déployer vos applications Laravel sur Heroku](https://www.kaherecode.com/tutorial/deployer-une-application-laravel-sur-heroku)
