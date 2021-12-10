class Members::DiariesController < ApplicationController

  def new
   @diary = Diary.new
   @diary.images.new
  end
  

  def create
    @diary = Diary.new(diary_params)
    @diary.member_id = current_member.id
    
    if @diary.save
    redirect_to diaries_path
    else
      unless @diary.images.present?
       @diary.images.new
        render 'new'
      else
        render 'new'
      end
    end
  end

  def index
    @diaries = Diary.all
    
  end

  def show
    @diary = Diary.find(params[:id])
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

  def diary_params
    params.require(:diary).permit(:title, :body, dir_images_attributes: [:dir_image, :id]).merge(member_id: current_member.id)
  end


end
