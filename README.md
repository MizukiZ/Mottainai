
# Project Name
***Mottainai***

## Description

The web site is called ***Mottainai***. Mottainai is thought of as an all-encompassing Japanese term for the four Rs: **reduce**, **reuse**, **recycle** and **respect**. This meaning is exactly what the concept of this project.

As I used to be one of backpackers, I had situations that I had to throw many stuffs which were still usable since I moved frequently. Each time I threw things I felt really guilty. So I thought It would be nice if I can give or sell my belongings to other backpackers, and vice verse.

This application is the marketplace that connects backpackers and travelers in Australia so that they can have a chance to give and sell to others and avoid wast at the same time.

## User stories
I made user stories to define what functionality my application should have.

I basically managed my project using [Trello](https://trello.com/b/pq0IHI2D "Trello").

## Workflow diagram
![Workflow diagram ](https://github.com/MizukiZ/Mottainai/blob/readme-images/readme_image/workflow.JPG "ERD ")

## Wireframe
Low fidelity wireframes on [Figma](https://www.figma.com/file/beBNSRUoIFpYrDXqkoxPvNM6/Project-mottainai,"Figma"). Both mobile and desktop design. Also includes color scheme.


## Entity Relationship Diagram
![Database design ](https://github.com/MizukiZ/Mottainai/blob/readme-images/readme_image/ERD.png "Workflow ")
## Duration
Approximately 110 hours.

## Challenge
My biggest challenge was to list user conversations by inside message's created time(the recent conversation room the user was in). First, I was trying to reach the message's created time data using Activerecord query interface but, it did not work as I expected so I searched and found **touch** method. The associated object will be touched when a belonged object is either saved or destroyed. Therefore, I could list the user conversations by its updated_at data.

![touch method ](https://github.com/MizukiZ/Mottainai/blob/readme-images/readme_image/touch%20method.JPG "touch method")

And, also I had two problems when I deployed on heroku. That were Assets pipeline issue and mailgun production setting. It took me some time to figure out.

## Technical issues
For some reason, I became not able to push application data to git remote repository. It hang at writing objects section. Probably, I have added a huge binary files or folder to git which I should have set as gitignore file. I end up deleting the current git and making new git and remote
repository.

## Future prospect

I would like to implement the search functionality that user can input how close the items should be (e.g. within 5km) and filter the items. Furthermore,  ban user account functionality to avoid bad users.

## Application on Heroku
[Mottainai](https://mottainai-project.herokuapp.com "Mottainai")
