Features
========

* Auto setup rubygems from Gemfile, bundle and generate related files.
* Can be used in exists project.

Installation
============

```ruby
group :development do
  ...
  gem 'venus', '~> 0.2.0'
  ...
end
```

Usage
=====

Project basic rubygems

```
rails generate venus:init
```

Setting Mysql connection

```
rails generate venus:mysql
```

Pagination gem "kaminari"

```
rails generate venus:paginate
```

Settings gem "settingslogic"

```
rails generate venus:settingslogic
```

gem 'devise', default generate model `User`

```
rails generate venus:devise
```

Facebook login (for model `User`)

```
rails generate venus:fbauth
```

Rspec testing framework

```
rails generate venus:rspec
```

TODO
====

* Capistrano with multi-stages extendsion.
* MongoDB / Redis configuration.
* Twitter Bootstrap layout.
* Carrierwave with rmagick & fog.
* Aws SES for sending email.
* RailsAdmin or ActiveAdmin.
* Sidekiq for background job.

Thanks
======

Idea is from xdite/bootstrappers (https://github.com/xdite/bootstrappers).

Contribution
============

Just send pull request :)