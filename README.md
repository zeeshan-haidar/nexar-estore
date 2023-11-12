# README

This README would normally document whatever steps are necessary to get the
application up and running.
ok we will do this

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# E-commerce Website README

This is the README file for an E-commerce website. This document provides an overview of the functional requirements and a use case diagram for the system.

## Functional Requirements

1. User Registration and Account Management:
     * User registration and login functionality.
     * Profile management (e.g., update personal information, change password).

2. Product Catalog:
     * Display product listings with images, descriptions, and prices.
     * Organize products into categories.

3. Search and Filtering:
     * Effective search functionality with filters such as by price, by category.
     * Advanced search options (e.g., by price range, brand, customer ratings).

4. Product Details:
     * Detailed product pages with product specifications and related products.
     * Multiple images and product zooming.

5. Shopping Cart:
     * Add, update, and remove items from the shopping cart.
     * Calculate and display the total order value.
     * Save shopping carts for later or wish lists.

6. Checkout Process:
     * Secure and user-friendly checkout with multiple payment options.
     * Shipping options, including various delivery methods and addresses.
     * Order summary and confirmation page.

7. Payment Gateway Integration:
     * Integration with payment processors using Stripe.
     * Secure handling of payment information.

8. Order Management:
     * Order history and status tracking for customers.
     * Order confirmation emails.

9. User Reviews and Ratings:
     * Allow customers to leave reviews and ratings for products.
     * Display product ratings and reviews on product pages.

10. User Accounts and Permissions:
     * Different user roles (e.g., customer, admin).
     * Admin dashboard for managing products, orders, and users.

11. Shipping and Logistics:
     * Integration with shipping carriers for real-time shipping cost calculation.

12. Security and Privacy:
     * Implement security measures to protect customer data using SSL.

13. Customer Support and Contact:
     * Contact forms, live chat.
     * FAQs and knowledge base.

14. Mobile Responsiveness:
     * Ensure the website is accessible and usable on various devices and screen sizes.

15. Social Media Integration:
     * Login via social media accounts.

16. Admin Notifications:
     * Alert administrators about new orders.

## Use Case Diagram

### User:
* Register
* Login
* Login through Facebook, Google, etc.
* View, update profile info and change password
* Live chat with customer support
* Browse products
* Search Products and apply filters based on categories
* View Product
* Add to favorites
* View favorite Products
* Add Product to Wishlist
* View Wishlist
* Add Product to cart
* View and manage cart
* Checkout
* Make payment
* View order history and its status
* Logout

### Administrator:
* Login
* Manage categories (Add/Update/Delete)
* Manage Products (Add/Update/Delete)
* View order notifications
* View orders
* Update order status (processing, pending, shipped)
* Logout

### System:
* Send registration confirmation email
* Send Order receipt email
* Send Order notification to Admin

# Notes:
* after adding a migration and running it, ro annotation for models and spec by
  bundle exec annotate command
* install redis server version 6.2.0

Feel free to use this README as a reference for your project or to share it with your team members to understand the functional requirements and use cases of the E-commerce website.
