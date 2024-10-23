# Inception

Inception is a project designed to deepen your understanding of Docker and Docker Compose by creating a complex multi-container application.

<img width="600" alt="Screenshot 2024-10-23 at 14 53 12" src="https://github.com/user-attachments/assets/01362c1d-11a7-4714-b7aa-1d8a37a19ef5">


## About the project

In the Inception project, you will create a network of three Docker containers: one containing Nginx, one containing WordPress, and one containing MariaDB. All three containers must work together to display a local website.

- **Nginx**: Acts as a web server to handle incoming requests.
- **WordPress**: Serves as the content management system for the website.
- **MariaDB**: Functions as the database to store and retrieve data for WordPress.

During execution, the Inception project launches a fully functional website accessible via a specified address.



## Running the project

To run the project, first clone the repository and navigate into the project directory. Update the .env file information to conform your needs.

Then, use the `make` command to compile the project.

The website should be viewable at:

``` https://localhost ``` or

``` http://<your-login>.42.fr ``` replace `your-login` with the value of the domain variable in the .env file.
