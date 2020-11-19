# CowGo

_R7. Identification of the problem you are trying to solve by building this particular marketplace app._

_R8._ _Why is it a problem that needs solving?_

## Pitch

Create an Uber-like service for livestock transport.

## Problem

Owners of small farms often do not have the capability (appropriate vehicles, experience, etc.) to move livestock that they are buying, selling or relocating and have to rely on their own contacts or large commercial operators to provide this service. Many farm operators do have the capability and may want the possibility to supplement their income. This means there is an opportunity to disrupt this industry by creating a web app that connects these two groups (livestock owners and transporters). Livestock owners would be able to enter the details of the job into a form and based on the details they are returned a curated list of available transporters. Job details include things such as origin and destination, quantity, and type of livestock, estimated total weight of cargo and any time restrictions.

_R9. A link (URL) to your deployed app (i.e. website)_

_R10. A link to your GitHub repository (repo)_

## Links 

[https://cowgo.herokuapp.com](https://cowgo.herokuapp.com)

[https://github.com/jezzabell91/cowgo1](https://github.com/jezzabell91/cowgo1)

<br>

--- 

<br>

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

Livestock owners can use the job form to input a job filling in required details such as, number of head, estimated weight, origin address, destination address and any special instructions. Transporters can view the available jobs that they are eligible. If their transport capacity is lower than the estimated weight of the job then that job won't show up in the available jobs list for that transporter. If a transporter accepts a job it is removed from the list of available jobs and is labelled "In Progress" in both the livestock owner's and transporter's respective job pages. Once completed it is updated to a completed status.

Livestock owners are able to post as many jobs as they wish and transporters are able to accept as many jobs as they want. 
### Sitemap
![Sitemap](https://i.imgur.com/HhHMI0Q.png)

Sitemap was made with the help of the sitemap_generator gem and [https://octopus.do/](https://octopus.do/)

### Screenshots

![Available Jobs Page](https://i.imgur.com/jyhtdlt.png)

![Specific Job Details](https://i.imgur.com/CW5QTQc.png)

### Target Audience

The target audience for CowGo is small hobby farmers who don't have the capability to move animals and other farmers who can help them out.

### Tech Stack

This is the tech stack:
    Development Language: Ruby
    Development Framework: Ruby on Rails
    Database: Postgresql
    Deployment: Heroku
    Frontend: TailwindCSS, HTML

<br>

--- 

<br>

_R12. User stories for your app_

## User Stories

|     **Epic**            |     **User Story**                                                                                                         |
|---------------------|------------------------------------------------------------------------------------------------------------------------|
|     Registration    |     As a livestock owner I want to   create an account with CowGo so that I can find someone to transport my cows      |
|                     |     As a transporter I want to join   CowGo so that I can earn extra income                                            |
|                     |     As a registered user I want to be   able to delete my account because I am no longer interested in CowGo           |
|     Profile         |     As a registered user I want to be   able to display a picture on my profile                                        |
|                     |     As a livestock owner I want transporters   to be able to see my public profile when I send them a job request      |
|                     |     As a transporter I want to be able   to add details such as truck capacity                                         |
|                     |     As a livestock owner I want to be   able to edit my profile so that it shows my details                            |
|     Jobs            |     As a livestock owner I want to   enter a job and get a list of the closest available transporters                  |
|                     |     As a livestock owner I want to be   able to view a map with the locations of the listed available transporters     |
|                     |     As a livestock owner I want to be   able to view the profiles of the listed available transporters                 |
|                     |     As a transporter I want to be able   to let the livestock owner know when the job has been completed               |
|                     |     As a livestock owner I want to   provide a rating and feedback to the transporter                                  |
|                     |     As a transporter I want to be able   to accept or decline the job                                                  |
|                     |     As a livestock owner I want to be   notified when my job request is accepted or declined                           |
|     Site            |     As a user I want to know how the   process works                                                                   |
|                     |     As a user I want to know about the   CowGo company                                                                 |
|                     |     As a user I want to know the   answers to commonly asked questions                                                 |
|     Login           |     As a user I want to be able to   reset my password if I forget it                                                  |
|     Payment         |     As a livestock owner I want to pay   via credit card when the transporter agrees to do the job                     |
|                     |     As the owner of CowGo I want to   receive a fee from every payment made                                            |
<br>

--- 

<br>

_R13. Wireframes for your app_
## Landing Page 
![CowGo Landing Page](https://i.imgur.com/O9J2uH3.png)

## Sign Up Page 
![CowGo Sign Up Page](https://i.imgur.com/4YGrIbg.png)

## Available Jobs Page 
![CowGo Available Jobs Page](https://i.imgur.com/0UcEsir.png)

<br>

--- 

<br>

_R14. ERD for your app_

## Entity Relationship Diagram
![CowGo Entity Relationship Diagram](https://i.imgur.com/i4BRdUL.png)




_R19. Provide your database schema design_ 

## Schema design ##
![CowGo Schema Design](https://i.imgur.com/v2eT6XK.png)

<br>

--- 

<br>

_R15. Explain the different high-level components (abstractions) in your app_


CowGo is developed using Ruby on Rails which utilises the MVC architecture pattern. The controller works in the middle and retrieves information from the databases via the model and passes this information to the view. An example in CowGo is the index action in the jobs controller. 

```ruby
# Shows Available Jobs 
def index
    @jobs = Job.where(accepted: false)
        if current_user.transporter_role == true && current_user.capacity.nil? == false
            @jobs = @jobs.select { |job| job.weight <= current_user.capacity }
            if @jobs.empty?

                flash.now[:alert] = 'There are no jobs that are available with your current capacity'
            end
        end
    end 
end
```

The controller queries the database and an array of jobs that have not been accepted is stored in the @jobs variable. Another query is sent to the database to validate that the current user is a transporter and has a non nil capacity, this query and many others in CowGo could be improved with more efficient query methods like join, preload and eager_load. The @jobs variable is then reduced by selecting only the jobs which match the criteria of the estimated job weight being less than or equal to the capacity of the transporter. This information is then passed to the jobs/index view via rails use of implicit render. In rails if RESTful routes and actions are used the controller will render the view associated with the action if no other view is specified.      

<br>

--- 

<br>

_R16. Detail any third party services that your app will use_

## Heroku 
CowGo is deployed with Heroku, a cloud deployment service. The source control workflow that is being used for development is the GitHub flow thus, feature branches need to be merged with main before they are pushed and Heroku is compatible with this flow. A Heroku pipeline has been implemented which allows for a multistage process before the app is deployed to production. The staging app part of the pipeline holds a deployable preproduction version of the app and allows manual deployment of feature branches. This means that each branch can be deployed and tested before merging with the main branch. Once merged with the main branch the pipeline has been configured to automatically build and deploy the staging app whenever the main branch of CowGo is pushed to the GitHub repository. If the deployed staging app is working as intended, it is promoted to the production app. 

## Devise
Devise handles user authentication including registration and session management (log in, log out). Using rails g devise:controller and rails g devise:views allows for customisation of the controller actions and the views. 

## Cloudinary 
Cloudinary is used as a cloud-based media host. CowGo Users can upload a profile image to display. The images are stored in the cloudinary account. Transformations are applied for a better experience. For CowGo the gravity option is set to “face” which automatically crops to the main face in an image, perfect for profiles.  

## dotenv
Dotenv is used to load environment variables from the .env file into ENV. It is used so that when source code is uploaded sensitive information such as API keys are not exposed.

## Inline SVG 
The inline-svg gem is used to make embedding svg images easy. The helper method inline_svg_tag has been used in the navbar to resize logo and allow the link_to method work.  

## activerecord-reset-pk-sequence 
The gem activerecord-reset-pk-sequence is used in the seeds file to reset the primary key of a table after calling the destroy_all method on the table. 
```
User.destroy_all
User.reset_pk_sequence
Job.destroy_all
Job.reset_pk_sequence
Address.destroy_all
Address.reset_pk_sequence
```

## TailwindCSS
A CSS framework used for easy styling of web applications. 

<br>

--- 

<br>

_R17. Describe your projects models in terms of the relationships (active record associations) they have with each other_

```ruby
class User < ApplicationRecord
  has_many :addresses, as: :addressable
  has_and_belongs_to_many :jobs
  before_destroy do
    jobs.each { |job| job.destroy }
  end

  has_one_attached :profile_image, dependent: :purge
```

Users can have many addresses. There is no limit to how many jobs a user (livestock owner) can create and a user (transporter) can accept many jobs. If a livestock owner posts a job and a transport owner accepts the job it can be said that both users belong to that job. If a user is deleted then the jobs that they had and belonged to are also deleted to prevent the situation where a job belongs to zero users. 

Users also have a profile image attached. 

```ruby
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
end
```
The Address model is interesting as both users and jobs can have many addresses. A polymorphic association was used as this allows for an address to be connected to either a user or a job. 

```ruby
class Job < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :addresses, as: :addressable
end
```
Jobs can belong to 1 or 2 users and must have two addresses, the origin and the destination. 

<br>

--- 

<br>

_R18. Discuss the database relations to be implemented in your application_

The ERD demonstrates how each of the database relations are connected. A join table (not a model), Job_User, is used for the many to many relationship between the Job and User models. The primary key (PK) of the User is used as a reference in the table as is the PK of the job. The resulting table looks like this:

![Job User join table](https://i.imgur.com/9TM47U4.png)

The Address relation has fields for Address id, addressable_type ("User" or "Job") and addressable_id. The Address id is the primary key and every record of Address can be found with it. The addressable_type and addressable_id are a composite foreign key. The addressable_type field identifies the associated model type, in this case "User" or "Job" and the addressable_id is the primarky key of the referenced entity. 

<br>

--- 

<br>

_R20. Describe the way tasks are allocated and tracked in your project_

## Task Allocation

Tasks were allocated on what was a need to have (required) for the mvp (green), what should be included but not quite essential (orange) and things that would be nice to have but not required for this sprint (blue). Checklists were used extensively to track tasks. Almost every task was derived from a user story. 

## Trello Board


![Trello 1](https://i.imgur.com/UkgEbEV.png)

![Trello 2](https://i.imgur.com/xcFSYH3.png)

![Trello 3](https://i.imgur.com/FIMUHfk.png)


<br>

--- 

<br>


## Resources

Figma

- Brainstorming Design system
- Figma Wireframe Kit (Free)

SVG Logo
[https://svglogomaker.com/](https://svglogomaker.com/)

Landing Page 
https://www.digitalocean.com/community/tutorials/build-a-beautiful-landing-page-with-tailwind-css#step-3-%E2%80%94-building-the-hero-section
