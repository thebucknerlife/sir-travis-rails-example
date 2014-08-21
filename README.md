Sir-Travis-Rails Example App - Nomadic
=====================================

This is a vanilla Rails 4.1 app setup with `sir-travis-rails`.

What I went through to get this to work:

1. Until accepted, we've got to use an old fork of the gem created by maxmcd - [maxmcd/sir-trevor-rails](https://github.com/maxmcd/sir-trevor-rails). To use this, slap this in your Gemfile:

    ```ruby
    gem 'sir-trevor-rails', git: 'https://github.com/maxmcd/sir-trevor-rails.git'
    ```
2. Follow the setup instructions as per usual.
3. Unfortunately, turbolinks wants to rain on our parade (surprise! surprise!). To get all the Sir Travis goodness, yank out turbolinks.
    
    From the Gemfile:
    ```ruby
    # Gemfile
    gem 'turbolinks' # remove or comment out this
    ```
    
    From our layout file... It should look like this after:
    ```ruby
    # application.html.erb
    <!DOCTYPE html>
    <html>
    <head>
      <title>Nomadic</title>
      <%= stylesheet_link_tag    'application', media: 'all' %> # remove turbolinks stuff from here
      <%= javascript_include_tag 'application' %>               # ...and from here
      <%= csrf_meta_tags %>
    </head>
    <body>

    <%= yield %>

    </body>
    </html>
    ```

    ...and from application.js:
    ```javascript
    # app/assets/javascripts/application.js
    //= require turbolinks # nuke this
    ```
4. And just a note - make sure whatever attirbute you're using for the Sir Travis editor is of type 'text', not 'string'. Text can hold more data.