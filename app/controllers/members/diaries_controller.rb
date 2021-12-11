class Members::DiariesController < ApplicationController

  def new
   @diary = Diary.new(diary_params)
   @diary.dia_images.build
  # @diary = Diary.new
  # @diary.images.new
  end


  def create
    @diary = Diary.new(diary_params["diary"])
    @diary.member_id = current_member.id

    binding.pry
    if @diary.save
     redirect_to diaries_path
    end
  end

  def index
    @diaries = Diary.all

  end

  def show
    @diary = Diary.find(params[:id])
    #binding.pry
  end

 def edit
   @diary = Diary.find(params[:id])
 end


  def update
    @diary = Diary.find(params[:id])
    @diary.update(diary_params)
    redirect_to diary_path(@diary.id)
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end


  private

  # def diary_params
  #   params.require(:diary).permit(:title, :body, dir_images_attributes: [:dir_image, :id]).merge(member_id: current_member.id)
  # end

  # def create_params
  #   params.require(:diary).permit(:title, :body, dir_images_attributes: [:image_id])
  # end


end

  private
  # def diary_params
  #   params.permit(
  #     :title,
  #     :body,
  #     dia_images_attributes: [:image_id],
  #   )
  #   .merge(member_id: current_member.id)
  # end

def diary_params
  #params.permit(:title, :body, :date, { images: [] })
  params.permit(diary: [:date, :body, :title, dia_images_images: []])
end




  #   def diary_params
  #   params.require(:diary).permit(
  #     :title,
  #     :body,
  #     images_attributes: [:image_id],
  #   )
  #   .merge(member_id: current_member.id)
  # end
