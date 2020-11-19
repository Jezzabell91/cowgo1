# CowGo

_R7. Identification of the problem you are trying to solve by building this particular marketplace app._

_R8._ _Why is it a problem that needs solving?_

## Pitch

Create an Uber-like service for livestock transport.

## Problem

Owners of small farms often do not have the capability (appropriate vehicles, experience, etc.) to move livestock that they are buying, selling or relocating and have to rely on their own contacts or large commercial operators to provide this service. Many farm operators do have the capability and may want the possibility to supplement their income. This means there is an opportunity to disrupt this industry by creating a web app that connects these two groups (livestock owners and transporters). Livestock owners would be able to enter the details of the job into a form and based on the details they are returned a curated list of available transporters. Job details include things such as origin and destination, quantity, and type of livestock, estimated total weight of cargo and any time restrictions.

_R9. A link (URL) to your deployed app (i.e. website)_

_R10. A link to your GitHub repository (repo)_

## Links (FIX LINKS)

[https://cowgo.herokuapp.com](https://cowgo.herokuapp.com)

[https://github.com/jezzabell91/cowgo1](https://github.com/jezzabell91/cowgo1)

_R11. Description of your marketplace app (website), including_:
 - Purpose
 - Functionality / features
 - Sitemap
 - Screenshots
 - Target audience
 - Tech stack (e.g. html, css, deployment platform, etc)

## Marketplace Description

### Purpose

The purpose of the CowGo marketplace web app is to connect livestock owners with farmers who can transport their livestock.

### Functionality / Features

A general outline of how the web app will work:

Users will use the sign-up form to register an account. They will select their role, either livestock owner or transporter, and create a profile that can be viewed by other users with details such as their general location, their company, a short description of their operation, a profile image, etc.

Livestock owners can use the job form to input a job filling in required details such as, number of head, estimated weight, origin, destination, special instructions, and time requirements. Using some of these details as arguments a ruby script runs and automatically generates quotes for each available transporter and returns to the livestock owner a view with an ordered list of the five transporters with the lowest quote. The livestock owner can then view the profiles of each listed transporter and see any ratings/feedback from previous completed jobs and they can then send a request to the transporter they select. The selected transporter gets an alert notification and a message with the job details and can accept or decline the job. If they decline the livestock owner is notified and are prompted to choose a different transporter.

If the transporter accepts the job it becomes a contract. The livestock owner is notified that the contract has been accepted and they are prompted to make a payment using Stripe to the transporter. At the contracted time and date, the transporter picks up the cargo at the origin and transports it to the destination. The transporter marks the contract as complete and the livestock owner is notified. The livestock owner must then leave a rating and feedback for the completed job.

### Sitemap
![Sitemap](https://i.imgur.com/HhHMI0Q.png)

Sitemap was made with the help of the sitemap_generator gem and [https://octopus.do/](https://octopus.do/)

### Screenshots

Enjoy some screen shots

### Target Audience

The target audience is

### Tech Stack

This is the tech stack

_R12. User stories for your app_

## User Stories

|     **Epic**            |     **User** Story                                                                                                                                       |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
|     Registration    |     As a livestock owner I want to   create an account with CowGo so that I can find someone to transport my cows                                    |
|                     |     As a transporter I want to join   CowGo so that I can earn extra income                                                                          |
|                     |     As a registered user I want to be   able to delete my account because I am no longer interested in CowGo                                         |
|     Profile         |     As a registered user I want to be   able to display a picture on my profile                                                                      |
|                     |     As a livestock owner I want transporters   to be able to see my public profile when I send them a job request                                    |
|                     |     As a transporter I want to be able   to show feedback from previous jobs in my profile                                                           |
|                     |     As a transporter I want to be able   to add details such as truck model, truck capacity and availability to my   profile                         |
|                     |     As a livestock owner I want to be   able to edit my profile so that it shows my details                                                          |
|     Jobs            |     As a livestock owner I want to   enter a job and get a list of the closest available transporters                                                |
|                     |     As a livestock owner I want to be   able to view a map with the locations of the listed available transporters                                   |
|                     |     As a livestock owner I want to be   able to view the profiles of the listed available transporters                                               |
|                     |     As a livestock owner I want to be   able to send a job request to the transporter I choose                                                       |
|                     |     As a transporter I want to receive   job requests with all the relevant details of the job                                                       |
|                     |     As a transporter I want to be able   to let the livestock owner know when the job has been completed                                             |
|                     |     As a livestock owner I want to   provide a rating and feedback to the transporter                                                                |
|     Contract        |     As a transporter I want the web   app to automatically calculate a quote to show based on total distance   travelled and estimated time frame    |
|                     |     As a transporter I want to be able   to accept or decline the job                                                                                |
|                     |     As a transporter I want to be   notified when a job request is made to me                                                                        |
|                     |     As a livestock owner I want to be   notified when my job request is accepted or declined                                                         |
|     Site            |     As a user I want to know how the   process works                                                                                                 |
|                     |     As a user I want to know about the   CowGo company                                                                                               |
|                     |     As a user I want to know the   answers to commonly asked questions                                                                               |
|     Login           |     As a user I want to be able to   reset my password if I forget it                                                                                |
|     Support         |     As livestock owner I want to be   able to contact CowGo support if there are any problems                                                        |
|                     |     As a transporter I want to be able   to contact CowGo support if there are any problems                                                          |
|                     |     As the support team of CowGo I   want to be able lock the account of any user that has breached terms and   conditions                           |
|                     |     As the support team of CowGo I   want to be able moderate the profiles of any user                                                               |
|                     |     As the support team of CowGo I   want to be able moderate the ratings and feedback provided after jobs are   completed                           |
|     Payment         |     As a livestock owner I want to pay   via credit card when the transporter agrees to do the job                                                   |
|                     |     As the owner of CowGo I want to   receive a fee from every payment made                                                                          |


_R13. Wireframes for your app_
## Landing Page 
![CowGo Landing Page](https://i.imgur.com/O9J2uH3.png)

## Sign Up Page 
![CowGo Sign Up Page](https://i.imgur.com/4YGrIbg.png)

## Available Jobs Page 
![CowGo Available Jobs Page](https://i.imgur.com/0UcEsir.png)
---

_R14. ERD for your app_
## Entity Relationship Diagram 
![CowGo Entity Relationship Diagram](https://i.imgur.com/J79ChBR.png)

---

_R15. Explain the different high-level components (abstractions) in your app_

--- 

_R16. Detail any third party services that your app will use_

### Heroku ###

CowGo is deployed with Heroku, a cloud deployment service. The source control workflow that is being used for development is the GitHub flow thus, feature branches need to be merged with main before they are pushed and Heroku is compatible with this flow. A Heroku pipeline has been implemented which allows for a multistage process before the app is deployed to production. The staging app part of the pipeline holds a deployable preproduction version of the app and allows manual deployment of feature branches. This means that each branch can be deployed and tested before merging with the main branch. Once merged with the main branch the pipeline has been configured to automatically build and deploy the staging app whenever the main branch of CowGo is pushed to the GitHub repository. If the deployed staging app is working as intended, it is promoted to the production app. 


Devise
Rolify
Stripe
Heroku
Cloudinary
Google Geocoding

--- 

_R17. Describe your projects models in terms of the relationships (active record associations) they have with each other_

<!-- With Polymorphic Association -->

User
has_one :address, as: :addressable
has_one :role
has_many :jobs, through: :user_jobs

Role
belongs_to :user

UserJob
belongs_to :user
belongs_to :jobs

Job
has_many :users, through: :user_jobs
has_many :addresses, as: :addressable

Address
belongs_to :addressable, polymorphic: true


## Resources

Figma

- Brainstorming Design system
- Figma Wireframe Kit (Free)


SVG Logo
[https://svglogomaker.com/](https://svglogomaker.com/)

Inline SVG
https://github.com/jamesmartin/inline_svg


Landing Page 
https://www.digitalocean.com/community/tutorials/build-a-beautiful-landing-page-with-tailwind-css#step-3-%E2%80%94-building-the-hero-section
