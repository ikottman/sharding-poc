class UsersController < ApplicationController
  around_action :choose_shard

  def index
    response = {}
    response['users'] = User.all
    render json: response
  end

  def choose_shard
    ActiveRecord::Base.connected_to(role: :writing) do
      yield
    end
  end
end