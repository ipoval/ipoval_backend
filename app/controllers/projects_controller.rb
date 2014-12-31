class ProjectsController < ApplicationController
  def index
    projects = ['Gobller', 'Machinima']

#    response.header["Access-Control-Allow-Origin"] = "*"
#    response.header["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept"

    render json: projects
  end
end
