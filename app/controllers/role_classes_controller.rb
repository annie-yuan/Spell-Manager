class RoleClassesController < ApplicationController
  def index
      @role_classes = RoleClass.all
  end

  def show
      @role_classes = RoleClass.find params[:id] 
  end
end
