class Members::DiariesController < ApplicationController

   def new
     @diary = Diary.new(diary_params)
     @diary.dia_images.build
   end


    def create
     @diary = Diary.new(diary_params["diary"])
     @diary.member_id = current_member.id
      if @diary.save!
        redirect_to diaries_path
      end
    end

    def index
      if params[:member_id].blank?
        @member = Member.find(current_member.id)
      else
        @member = Member.find(params[:member_id])
      end
      @diaries = Diary.where(member_id: @member.id)
    end

    def show
      @diary = Diary.find(params[:id])
      @dia_comment = DiaComment.new
      @comments = @diary.dia_comments.order(created_at: :desc)
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
    params.permit(diary: [:date, :body, :title, dia_images_images: []])
  end

end
