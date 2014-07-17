#Seed for User still not working due to Devise complication
#user = User.find_or_create_by(name: 'Hafiz',
            #email: 'ibnukamy@gmail.com',
            #encrypted_password: "$2a$10$PVHF3I84VxDHSBbxKslKLuD47brT7OgXLYopZyAiRG4.1mWY00056",
            #github_account: 'ibnukamy',
            #twitter_account: 'ibnukamy'
            #)

Project.find_or_create_by(name: 'Internbox',
                          github_url: 'https://github.com/ibnukamy/internbox',
                          mentor_role: 'Pair Programmer',
                          project_level: 'Intermediate',
                          description: 'Application to enchance interns education perfomance',
                          user_id: 1 
                          )
