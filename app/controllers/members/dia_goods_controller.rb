class Members::DiaGoodsController < ApplicationController
  
  def create
    diary = Diary.find(params[:diary_id])
    good = current_member.dia_goods.new(diary_id: diary.id)
    good.save
    redirect_to diary_path(diary)
  end

  def destroy
    diary = Diary.find(params[:diary_id])
    good = current_member.dia_goods.find_by(diary_id: diary.id)
    good.destroy
    redirect_to diary_path(diary)
  end
  
end
