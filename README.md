# Project Phonify first draft

## Description

Web application that lets a user view phones, add them to cart and checkout

## Deliverables

User can view all phones

User can view reviews

User can view items counter on cart

User can add phones to cart

User can delete teams from their cart

User can update order from their cart

User can navigate to pages using react router

## Stretch

More Feautures on frontend

Frontend built using redux

More models and more complex backend

Admin section to the website

Fully functional admin wesbite to update stock and see payments

## Mockup

![mockup-1](https://user-images.githubusercontent.com/70832391/168681294-29fa5601-a632-48f9-af24-352f7a2eebbe.png)
![mockup-2](https://user-images.githubusercontent.com/70832391/168681370-35191df3-4529-432d-8366-26dbf9dd93f7.png)
![mockup-3](https://user-images.githubusercontent.com/70832391/168681382-f226c717-0243-4e19-b5f3-f1d1ae05af30.png)
![mockup-4](https://user-images.githubusercontent.com/70832391/168681388-4f4049b1-dd75-43b3-bc5b-88a567d9cbc5.png)
![mockup-5](https://user-images.githubusercontent.com/70832391/168681407-5c7595a9-6cd7-47d2-a441-f9b2e6fd1550.png)
![mockup-6](https://user-images.githubusercontent.com/70832391/168681417-65a4599f-87dd-44c3-a9d3-4ab2dd679bf2.png)

## Backend

![backend-wireframe](https://user-images.githubusercontent.com/70832391/168678705-78a60148-f0f7-4b63-8544-bd33933bfaf7.png)

## User Model

User has many reviews

User has many phones, through reviews

## Phone Model

Phone has many reviews

Phone has many users through reviews

## Review Model

belongs_to :user

belongs_to :phone
