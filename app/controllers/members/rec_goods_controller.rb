class Members::RecGoodsController < ApplicationController
   before_action :authenticate_member!

  def create
    @record = Record.find(params[:record_id])
    @good = current_member.rec_goods.new(record_id: @record.id)
    @good.save
    # redirect_to record_path(record)
  end

  def destroy
    @record = Record.find(params[:record_id])
    @good = current_member.rec_goods.find_by(record_id: @record.id)
    @good.destroy
    # redirect_to record_path(record)
  end
end
