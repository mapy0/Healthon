class Members::DiaGoodsController < ApplicationController
   before_action :authenticate_member!
  
  def create
    @diary = Diary.find(params[:diary_id])
    @good = current_member.dia_goods.new(diary_id: @diary.id)
    @good.save

  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    @good = current_member.dia_goods.find_by(diary_id: @diary.id)
    @good.destroy
  end

  
end


