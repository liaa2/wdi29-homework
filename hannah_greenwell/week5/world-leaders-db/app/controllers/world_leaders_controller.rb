class WorldLeadersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def index
    @world_leaders = WorldLeader.all
  end

  def show
    @world_leader = WorldLeader.find params[:id]
  end

  def new
  end

  def create
    WorldLeader.create(
      name: params[:name],
      country: params[:country],
      years_in_office: params[:years_in_office],
      alive: params[:alive],
      image: params[:image],
      quote: params[:quote]
    )

    redirect_to leaders_path
  end

  def edit
    @world_leader = WorldLeader.find params[:id]
  end

  def update
    world_leader = WorldLeader.find params[:id]

    world_leader.update(
      name: params[:name],
      country: params[:country],
      years_in_office: params[:years_in_office],
      alive: params[:alive],
      image: params[:image],
      quote: params[:quote]
    )

    redirect_to leader_path(world_leader.id)
  end

  def destroy
    world_leader = WorldLeader.find params[:id]
    world_leader.destroy

    redirect_to leaders_path
  end
end
