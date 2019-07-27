# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
 2.5.3

## Gem
* gem gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
* gem 'trestle'
* gem 'carrierwave', '~> 1.0'
* gem 'mini_magick', ">= 4.9.4"

## trestle admin
* rails generate trestle:resource Product
* rails generate trestle:resource Category
* rails generate trestle:resource Home

## add Category
* rails g model Category title:string sorting:integer
* rails g model Home image:string desc:text sorting:integer

## carrierwave
* rails generate uploader Image
* rails generate uploader Home