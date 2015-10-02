#Gradejoy

[![Build Status](https://travis-ci.org/robertlandreaux/Gradejoy.png)](https://travis-ci.org/robertlandreaux/Gradejoy)

This project is being rewritten -- https://github.com/robertlandreaux/gradejoyV2

Gradejoy is an online gradebook application teachers

Rails version 4.2.3.

Ruby version 2.2.2.

Visit http://gradejoy.com.

This project is still in progess; not every feature works yet.

To run this locally, you need to have Ruby version 2.2.2 and Rails version 4.2.0 installed.
This application uses PostgreSQL in all environments.
Run `rake db:create`, `rake db:migrate`, and `rake db:seed` in your command line. Run `rails s` in your command line. The application should run at localhost:3000
in your browser. You can login with these credentials from db/seeds.rb:

Email -- devuser@dev.com

Password -- password1

Comment on the Github page or email any questions, comments, or criticisms to robertlandreaux@gmail.com.

### Contributing

Feel free to contribute to this project! The Github Issues (scroll to top and look right) contains tasks that need work.

1. Clone it (`git clone https://github.com/robertlandreaux/gradejoy.git`).

2. Create your feature branch (`git checkout -b my-new-feature`).

3. Commit your changes (`git commit -am 'Add some feature'`).

4. Push to the branch (`git push origin my-new-feature`).

5. Create a new Pull Request on Github.

When running `git pull`, please run `git pull --rebase`. When updating your branch with master, please run `git rebase master`.
