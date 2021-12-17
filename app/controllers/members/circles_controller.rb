class Members::CirclesController < ApplicationController

  def new
    @circle = Circle.new
    @circle.members << current_member
  end

   def create
     @circle = Circle.new(circle_params)
    # @circle.member_ids = current_member.id
      if @circle.save!
        CircleMember.create!(member_id: current_member.id, circle: @circle)
        redirect_to circles_path, notice: 'Create Sucsess :)!!'
      else
        render :new, alert: 'Create false :('
      end
   end


  def index
    @circles = Circle.all.order(updated_at: :desc)
    @circle_joining = CircleMember.where(member_id: current_member.id)
    @circle_lists_none = "Circleに参加していません"
  end

  def show
    @circle = Circle.find(params[:id])
    @members = Member.find(@circle.member_ids)
    @cir_comment = CirComment.new
     
     #@circle = Circle.find_by(id: params[:id])

    # if !@circle.members.include?(current_member)
    #   @circle.members << current_member
    # end
    # @cir_comments = CirComment.where(circle_id: @circle.id).all
  end

  def edit
   @circle = Circle.find(params[:id])
  end

  def update
    circle = Circle.find(params[:id])
    circle.update(circle_params)
  end
  
  def destroy
    circle = Circle.find(params[:id])
    circle.destroy
    redirect_to circles_path
  end


  private
  def circle_params
    params.require(:circle).permit(:name, :infomation, :maximam_member, :image, member_id: [])
  end


  def cir_comment_params
    params.require(:cir_comment).permit(:comment)
  end


end

