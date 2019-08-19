class UsersController < ApplicationController
  around_action :choose_shard

  def index
    response = {}
    response['users'] = User.all
    render json: response
  end

  def show
    response = User.find_by last_name: params[:id]
    render json: response
  end

  def choose_shard
    # default to shard 0
    db = :shard0
    db = :shard1 if request.path.include? "one"
    puts "connecting to: #{db}"

    ActiveRecord::Base.connected_to(database: db) do
      yield
    end
  end
end
