# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
 2.5.3

## Gem
* gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
* gem 'hirb-unicode', '~> 0.0.5'
* gem 'trestle'
* gem 'trestle-tinymce', '~> 0.1.3'
* gem 'trestle-auth'
* gem 'carrierwave', '~> 1.0'
* gem 'mini_magick', ">= 4.9.4"
* gem 'aasm'
* gem 'devise'


## trestle admin
* rails generate trestle:resource Product
* rails generate trestle:resource Category
* rails generate trestle:resource Home
* rails generate trestle:resource User
* rails generate trestle:auth:install
* Administrator.create(email: "yha0971", password: "1111", first_name: "hsinhua", last_name: "chen")

## add Model
* rails g model Category title:string sorting:integer
* rails g model Home image:string desc:text sorting:integer

## carrierwave
* rails generate uploader Image
* rails generate uploader Home

## add spec
* rails g migration add_spec_to_projects spec:text


## devise
* rails generate devise:install
* rails generate devise user
* rails generate devise:views
