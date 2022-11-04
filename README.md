![Microverse](https://img.shields.io/badge/-Microverse-%20%236f23ff?style=for-the-badge) 

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

# Blog App 🗒️💡✏️❤️

> This repo holds a simple blog website app built with ROR. The website shows the list of posts and empowers readers to interact with them by adding comments and liking posts.

## Database ERD Diagram :memo:

![](./blog_app_erd.png)


## Built With :hammer_and_wrench: 

- **Ruby** Popular programming language that’s used for lots of things, from web app development to data analysis.
- **GitHub flow:**  Correct use of Branches for deployment and features development.
- **Linters Check (Rubocop & Stylelint):** Local and Pull Request check for errors, bugs and stylistic errors in code.
- **PostgreSQL:** A powerful, open source object-relational database system.
- **Rails:** A web application development framework written in the Ruby programming language. This app currently implements version 7.0.4


## Getting Started ➡️

To get a local copy up and running follow these simple steps.:arrow_down:

- Check the Ruby version or if you have at all by running `ruby -v` if it returns  `ruby 3.1.2p20 (2022-04-12 revision 4491bb740a)` or similar, you have Ruby installed.

* Ruby version used `ruby 3.1.2`

### Setup 🛠️

- Clone the repository using the GitHub this link [🔗](https://github.com/karlavdelgadof/Blog-app-ror.git)
- `cd Blog-app-ror`
- Run `bundle install`
- Run `rails server`
- Open Browser `http://localhost:3000/`
- Ensure you have PostgreSQL installed before running the application`psql --version`.
- Run `rails db:create`.
- Create a [.envs](https://medium.com/geekculture/postgresql-rails-and-macos-16248ddcc8ba) file using the link to host postgres credentials.

### Testing

To run tests:
 - Ensure you have `RSpec` installed: running bundle install will install it since it is included in the `Gemfile`.
 - To run a specific test:
 - Run `rspec spec/models<name_of_spec_file>`
 - To run all tests:
 - Run `rspec spec`

## Authors :writing_hand:

:woman_technologist:  **Karla Delgado** :writing_hand: 

- GitHub: [@karlavdelgadof](https://github.com/karlavdelgadof)
- Twitter: [@karlavdelgadof](https://twitter.com/karlavdelgadof)
- LinkedIn: [Karla Delgado](https://www.linkedin.com/in/karla-delgado-613a32239/)


## Project Milestones 📌 

- Milestone 1: Creating a data model. ✅
- Milestone 2: Processing data in models.	✅
- Milestone 3: Validations and Model specs. ✅
- Milestone 4: Setup and controllers. ✅
- Milestone 5: Controllers specs. ✅
- Milestone 6: Views. ✅
- Milestone 7: Forms. ⚙️
- Milestone 8: Integration specs for Views and fixing n+1 problems. ⚙️
- Milestone 9: Add Devise. ⚙️
- Milestone 10: Add authorization rules. ⚙️
- Milestone 11: Add API endpoints. ⚙️
- Exercise: API documentation. ⚙️

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
