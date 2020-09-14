# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 as part of the Web Development Bootcamp at Lighthouse Lab. The goal of the project was to learn a new language in 1 week.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Current Functionality

As a logged in user you can:

- Add items to your cart
- Add, edit and delete reviews and rating on a product page
- Pay for your order via stripe
- Receive a confirmation email for your order

As an admin user you can:

- Add and delete products from the e-commerce
- Add and delete categories from the e-commerce
- Have access to a dashboard to see your stock, products available and existing categories

## Screenshots

!["Homepage"](https://raw.githubusercontent.com/vbedardl/jungle/master/doc/Homepage_Screenshot.png)
!["Product page"](https://raw.githubusercontent.com/vbedardl/jungle/master/doc/Productpage_Screenshot.png.png)
!["Cart page"](https://raw.githubusercontent.com/vbedardl/jungle/master/doc/Cart_Screenshot.png.png)
!["Order page"](https://raw.githubusercontent.com/vbedardl/jungle/master/doc/Order_Screenshot.png.png)
