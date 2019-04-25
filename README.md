# Racial Bias Reporter
## About the project ##
This project aims to provide college students with a simple, quick, and secure method of reporting incidents of racial bias to their school. The project will be implemented via a web application developed using Ruby on Rails, PostgreSQL, HTML, CSS and JavaScript.

See the wiki for the full project details and documentation. Contributor guidelines can be found on a separate wiki page as well.

## Running the application ##
The application is fully contained in the `code` directory. To run it, follow these steps:
* Clone this repository and navigate to the `code` directory
* In your terminal, do `bundle install` to install dependencies
* Do `rails db:create` to create the database
* Do `rails db:migrate` to migrate the database
* Finally, do `rails server` to run the application

The app will be live at http://<your_server_name>:3000/, where <your_server_name> is the name of your virtual machine, or is simply "localhost" if you're running the app natively.

# Please Note:
It is expected that you will be running this app on a Linux machine with Ruby version 2.5.1 and Rails version 5.2.2 already installed and setup. Additionally, it is expected that this app will be ran on a machine that has already installed and configured postgreSQL version 9.2.24.
