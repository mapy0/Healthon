class Members::RecordsController < ApplicationController
  
  def new
   @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.member_id = current_member.id
    @record.save
    redirect_to records_path
  end


  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end
  
 def edit
   @record = Record.find(params[:id])
 end
  
  
  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    redirect_to record_path(@record.id)
  end
  
  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end
    
  
  
  private

  def record_params
    params.require(:record).permit(:weight, :bmi, :bf, :mm, :mus, :tbw, :sm)
  end

  
  
end
