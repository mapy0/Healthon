class Members::RecordsController < ApplicationController

  def new
   @record = Record.new
   @record.rec_images.build
   @meal = @record.meals.build
   @workout = @record.workouts.build
  end

  def create
    @record = Record.new(record_params)
    @record.member_id = current_member.id
    @record.save!
    redirect_to records_path
  end


  def index
  if params[:member_id].blank?
      @member = Member.find(current_member.id)
  else
      @member = Member.find(params[:member_id])
  end

  @records = Record.where(member_id: @member.id).order(date: "ASC")
  @last_record = @member.records.order(date: :asc).last

    # @records = Record.where(member_id: params[:member_id]).order(date: "ASC")
    # Coffee使用中止
    # gon.chart_label = Record.pluck(:date)
    # gon.chart_data_w = Record.pluck(:weight)
    # gon.chart_data_bf= Record.pluck(:bf)

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
    end

  end


  def show
    @record = Record.find(params[:id])
    @rec_comment = RecComment.new
  end


 def edit
   @record = Record.find(params[:id])
 end


  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    redirect_to records_path
    #redirect_to record_path(@record.id)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  # def record_params
  #   params.permit(record: [:weight, :bmi, :bf, :mm, :mus, :tbw, :sm, :date, rec_images_images: [],
  #   meals_attributes:[:id, :record_id, :my_meal_id, :date, :time, :name, :calorie, :_destroy],
  #   workouts_attributes:[:id, :record_id, :my_workout_id, :date, :name, :burned_calorie, :_destroy]]).merge(member_id: current_member.id)
  # end
  
  def record_params
    params.require(:record).permit(:weight, :bmi, :bf, :mm, :mus, :tbw, :sm, :date, rec_images_images: [],
    meals_attributes:[:id, :record_id, :my_meal_id, :date, :time, :name, :calorie, :_destroy],
    workouts_attributes:[:id, :record_id, :my_workout_id, :date, :name, :burned_calorie, :_destroy]).merge(member_id: current_member.id)
  end #こちらにするとNewが入らず、上にするとEditができない
  

end


