# Seed for User still not working due to Devise complication
admin = Admin.find_or_initialize_by(name: 'Clarence',
                                email: 'clarence@tinkerbox.co.sg',
                                password: 'adminpass12345',
                                password_confirmation: 'adminpass12345',
                                github_account: 'clarence',
                                twitter_account: 'clarence',
                                availability: true
                                )
# admin.skip_confirmation!
admin.save!

user = User.find_or_initialize_by(name: 'Hafiz',
            email: 'ibnukamy@gmail.com',
            password: 'userpass12345',
            password_confirmation: 'userpass12345',
            github_account: 'ibnukamy',
            twitter_account: 'ibnukamy',
            mentor_id: admin.id
            )
# user.skip_confirmation!
user.save!

project = Project.find_or_initialize_by(name: 'Internbox',
                                    github_url: 'https://github.com/ibnukamy/internbox',
                                    mentor_role: 'Pair Programmer',
                                    project_level: 'Intermediate',
                                    description: 'Application to enchance interns education perfomance',
                                    user_id: 1
                                    )
# project.skip_confirmation!
project.save!
