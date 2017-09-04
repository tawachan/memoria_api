class RegistrationsModifiedController < DeviseTokenAuth::RegistrationsController

  def create
    super do |user|
      project = user.projects.new(name: 'First Project (Sample)', description: 'describe your project')
      project.save
      todo = project.todos.new(task: 'your first wish', user: user)
      todo.save
    end
  end

  private
  def sign_up_params
    params.permit(:name, :email, :password)
  end
  def account_update_params
    params.permit(:name, :email)
  end
end
