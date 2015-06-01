#Gradejoy

[![Build Status](https://travis-ci.org/robertlandreaux/Gradejoy.png)](https://travis-ci.org/robertlandreaux/Gradejoy)

Gradejoy is an online gradebook application for students and teachers. Currently it is only functional for teachers.

Rails version 4.2.0.

Ruby version 2.2.2.

Visit http://gradejoy.com.

This project is still in progess; not every feature works yet.

To run this locally, you need to have Ruby version 2.1.3 and Rails version 4.0.2 installed.
This application uses PostgreSQL in all environments. You may change that in config/database.yml.
Rename config/application.yml.example to config/application.yml. That file will set random environment variables for you.
The application will not send mail in development mode. Run `rake db:setup` in your command line. Run `rails s` in your command line. The application should run at localhost:3000
in your browser. You can login with these credentials:

Email -- devuser@dev.com

Password -- password1

If you want to create additional user accounts, modify the code within db/seeds.rb.

Comment on the Github page or email any questions, comments, or criticisms to robertlandreaux@gmail.com.

### Contributing

Feel free to contribute to this project! The Github Issues (scroll to top and look right) contains tasks that need work.

1. Fork it.

2. Clone it (`git clone https://github.com/YOUR_USERNAME/gradejoy.git`).

3. Set the remote upstream(`git remote add upstream https://github.com/robertlandreaux/gradejoy.git`).

4. Fetch the latest commits and branches (`git fetch upstream`).

5. Check out your fork's local master branch (`git checkout master`).

6. Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes (`git merge upstream/master`).

7. Create your feature branch (`git checkout -b my-new-feature`).

8. Commit your changes (`git commit -am 'Add some feature'``).

9. Push to the branch (`git push origin my-new-feature`).

10. Create new Pull Request on Github.
