class Members::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: %I[show edit update destroy followings followers]

 def show
   @member = Member.find(params[:id])

   @records = Record.where(member_id: params[:id]).order(date: "ASC")
    @record_dates = []
    @record_weight = []
    @record_bf = []
    @record_mus = []
    @record_sm = []
    @records.each do |record|
      @record_dates.push(record.date.strftime("%m月 %d日"))
      @record_weight.push(record.weight)
      @record_bf.push(record.bf)
      @record_mus.push(record.mus)
      @record_sm.push(record.sm)

    @last_record = @member.records.order(date: :asc).last
    @diaries = @member.diaries.order(created_at: :desc).limit(3)
    @workouts = Workout.all.order(created_at: :desc).limit(3)
    end
 end

 def edit
   @member = Member.find(params[:id])
 end


  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end


  def followings
    @followings = @member.followings
  end

  def followers
    @followers = @member.followers #follower_id カラムがないしこれでは取得できていない
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:name, :image, :self_introduction)
  end



end