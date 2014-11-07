###Internbox for Tinkerbox

This application was created as a part of programming interview for Tinkerbox's interns.
###Developer's Note

This project can be cloned at:
`git clone https://github.com/ibnukamy/internbox.git`

`rake db:migrate`

`rake db:seed`

####Dependencies

Refer the `Gemfile` for the complete reference.

```Ruby
ruby 2.1.2 
gem 'rails', '4.1.1'
#default gems are omitted
gem 'devise', github: 'plataformatec/devise'
gem 'foundation-rails'
gem 'figaro'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
end

#test
group :test do
  gem 'capybara', '~> 2.4.1'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'selenium-webdriver', '~> 2.42.0'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'email_spec', '~> 1.6.0'
end
```

###Features

####Intern
- Intern can choose his/her mentor based on availability.
- Intern can create projects.
- Intern can edit or delete his projects.
- Intern view other interns' projects.
- Intern cannot edit or delete other interns' projects.

####Mentor
- Mentor will receive an email every time interns under their supervision create a new project.
- Mentor can supervise more than one intern.
- Mentor can switch availability.
- Mentor can edit or delete all projects (Admin).

####Project
- Project belongs to the intern who created it.
- Project can be tagged with tags.
- Projects can be sorted by tags.
- All projects can be viewed at the home page.

###TODO
- Dashboard for Mentor.
- Pair Programming schedule management for interns.
- UX flow
- Complete redesign (Using Bourbon-Neat)

This is a work in progress.
