# Jungle

Jungle is a mini e-commerce application built with Rails 4.2.

## Setup and launch

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Run `bin/rails s -b 0.0.0.0` to start the server
5. Visit localhost:3000 in your browser

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Use and future expiration date and any three digit security code.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Sass-Rails
* bcrypt
* Stripe
* See Gemfile for the other dependencies.

## Screenshots

!["Screenshot of product index page"](https://github.com/somusz/jungle-rails/blob/master/docs/Jungle%20-%20Products.png?raw=true)
!["Screenshot of product show page"](https://github.com/somusz/jungle-rails/blob/master/docs/Jungle%20-%20Product%20Show.png?raw=true)
!["Screenshot of cart page"](https://github.com/somusz/jungle-rails/blob/master/docs/Jungle%20-%20Cart.png?raw=true)
!["Screenshot of payment page"](https://github.com/somusz/jungle-rails/blob/master/docs/Jungle%20-%20Payment.png?raw=true)
!["Screenshot of order confirmation page"](https://github.com/somusz/jungle-rails/blob/master/docs/Jungle%20-%20Order%20Confirmation.png?raw=true)
