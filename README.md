# README

# NEXAR ESTORE

NEXAR ESTORE is an eCommerce solution which is designed to provide a seamless and user-friendly shopping experience, offering robust features to enhance both customer and admin interactions. Users can easily register, manage their accounts, and browse through a comprehensive product catalog organized by categories. Each product has a detailed page with multiple images, and related product recommendations. The shopping cart allows users to add, update, and remove items, while the secure checkout process supports various payment options, integrated via Stripe for safe transactions. Admins can manage products and categories through a dedicated dashboard, and users can log in via social media, maintain a wishlist, and review their order history. This solution combines convenience, security, and flexibility to meet the needs of modern online shopping.

The technologies and frameworks used in this project include Ruby on Rails 7, along with Stimulus and Hotwire Turbo for enhanced frontend interactivity. Stripe is integrated as the payment gateway for secure transactions. AWS S3 is used for product image storage and uploading. Social media login functionality is implemented using Omniauth with Facebook and Google OAuth2. For authentication and authorization, Devise and CanCanCan are utilized to ensure secure and role-based access control.
## Functional Requirements

1. User Registration and Account Management:
     * User registration and login functionality.
     * Profile management (e.g., update personal information, change password).

2. Product Catalog:
     * Display product listings with images, descriptions, and prices.
     * Organize products into categories.

3. Product Details:
     * Detailed product pages with product specifications and related products.
     * Multiple images.

4. Shopping Cart:
     * Add, update, and remove items from the shopping cart.
     * Calculate and display the total order value.

5. Checkout Process:
     * Secure and user-friendly checkout with multiple payment options.
     * Shipping options
     * Order summary and confirmation page.

6. Payment Gateway Integration:
     * Integration with payment processors using Stripe.
     * Secure handling of payment information.

7. Order Management:
     * Order history.

8. User Accounts and Permissions:
     * Different user roles (e.g., customer, admin).
     * Admin dashboard for managing products, categories
   
9. Social Media Integration:
     * Login via social media accounts ie google, facebook.
   
10. Product wishlist:
    * User can add and remove products into wishlist

# Notes:
* after adding a migration and running it, do annotation for models and spec by
  bundle exec annotate command
* install redis server version 6.2.0

Feel free to use this README as a reference for your project or to share it with your team members to understand the functional requirements and use cases of the E-commerce website.
