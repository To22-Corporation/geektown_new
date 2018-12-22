class User::GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end
end
