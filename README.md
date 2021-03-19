# ios-training-backend

Backend for Wolox iOS Training.
<br/><br/>

## Requirements
* Ruby 3.x
* Rails 5.x
* Postgres 13.x

## Documentation
_Work in progress_

## API
The app is now running on Heroku. You can interact with it through this URL: <br/>
```
https://ios-training-backend.herokuapp.com/api/v1/
```

### Example
```
curl https://ios-training-backend.herokuapp.com/api/v1/books
```
<br/>


## DER

![alt text](https://github.com/wolox-training/swift-training-backend/blob/master/DER.png)
<br/>

## Running locally

Run the following commandas to set up the project:
```
gem install bundler
bundle install
rails db:setup
rails db:migrate
rails db:seed
```
<br/>

Once finished, you can now run the project with:
```
rails server
```
<br/>

All done! You're ready to start using the API :)

<br/>

## Deploying to Heroku

1) Install Heroku CLI:
```
brew install heroku/brew/heroku
```
<br/>

2) Log in to Heroku:
```
heroku login
```
<br/>

3) Ask your Team Leader to add you as a Collaborator in the Heroku Dashboard. This will give you the proper permissions to push to the Heroku repository.
<br/>

4) Great! You are ready to deploy. In order to do so, run the following command:
```
git push heroku
```
<br/>

If you ever need to run database commands in the Heroku instance, you can do it by adding a `heroku` prefix, like this:
```
heroku rails db:seed 
```

This executes `rails db:seed` in the Heroku instance.

## Logs

The logs can be checked from the [Dashboard](https://dashboard.heroku.com/apps/swift-training-backend/activity).

You can also check the logs from the terminal by using the following command:
```
heroku logs --tail
```
