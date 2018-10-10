class MembersController < ApplicationController

  # CREATE
    def new
      @member = Member.new   # create a blank object for the form_for helper to use
    end

    def create
      Member.create member_params  # pass in the strong version of the form params
      redirect_to( members_path )  # redirect to the index "/works"
    end

    # READ
    def index
      @members = Member.all
    end

    def show
      @member = Member.find params[:id]  # ID is in params because of the route "/works/:id"
    end

    # UPDATE
    def edit
      @member = Member.find params[:id]
    end

    def update
      @member = Member.find params[:id]   # route is PATCH "/members/:id", so we have the ID in params
      @member.update member_params
      redirect_to member_path(@member.id)
    end

    # DESTROY
    def destroy
      @member = Member.find params[:id]
      @member.destroy
      redirect_to( members_path )
    end

    private

    def member_params
      params.require(:member).permit(:name, :about, :title, :seat, :image, :party_id)
    end
end
