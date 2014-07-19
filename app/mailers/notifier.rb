class Notifier < ActionMailer::Base
  default from: "internboxapp@gmail.com"

  def new_project(project)
    @project = project
    @user = project.intern
    @mentor = @user.mentor

    subject = "[Internbox] New Project: #{@project.name} by #{@user.name}"

    mail(to: @mentor.email,
         subject: subject
        )
  end
end
