class Members::WoRankingsController < ApplicationController

  # def monthly
  #   #ここがよくわからない
  #   if params[:pre_preview].present?
  #     @target_month = Date.parse(params[:pre_preview]) << 1
  #   elsif params[:next_preview].present?
  #     @target_month = Date.parse(params[:next_preview]) >> 1
  #   else
  #     @target_month = Time.current.to_date << 1
  #   end

  #   @wo_ranks = Record
  #                 .joins(:workouts)
  #                 .select("records.member_id
  #                         ,sum(workouts.burned_calorie) as workout_calorie
  #                         ,to_char(records.date,'YYYY') as workout_year
  #                         ,to_char(records.date,'MM') as workout_month
  #                         ,round(sum(workouts.burned_calorie),1) as total_workout
  #                         ,RANK () OVER (PARTITION BY to_char(records.date,'YYYY'),to_char(records.date,'MM')
  #                                         order by (sum(workouts.burned_calorie) desc) as rank_number")
  #                 .where(study_date: @target_month.all_month)
  #                 .group("to_char(records.date,'YYYY')
  #                         ,to_char(records.date,'MM')
  #                         ,record.member_id")
  #                 .order("(sum(workouts.burned_calorie))desc)")
  #   @my_rank = 0
  #   @wo_ranks.each do |wo_rank|
  #     if wo_rank.member_id == current_member.id
  #       @my_rank = wo_rank.rank_number
  #       break #breakとは？
  #     end
  #   end
  # end

  # def weekly
  #   @wo_ranks = Record
  #                 .joins(:workouts)
  #                 .select("records.member_id
  #                         ,sum(workouts.burned_calorie) as workout_calorie
  #                         ,to_char(records.date,'YYYY') as workout_year
  #                         ,to_char(records.date,'MM') as workout_month
  #                         ,round(sum(workouts.burned_calorie),1) as total_workout
  #                         ,RANK () OVER (PARTITION BY to_char(records.date,'YYYY'),to_char(records.date,'MM')
  #                                         order by (sum(workouts.burned_calorie) desc) as rank_number")
  #                 .where(date:0.days.ago.prev_week..0.days.ago.prev_week(:sunday))
  #                 .group("to_char(records.date,'YYYY')
  #                         ,to_char(records.date,'MM')
  #                         ,record.member_id")
  #                 .order("(sum(workouts.burned_calorie))desc)")
  #   @my_rank = 0
  #   @wo_ranks.each do |wo_rank|
  #     if wo_rank.member_id == current_member.id
  #       @my_rank = wo_rank.rank_number
  #       break #breakとは？
  #     end
  #   end
  # end

  # def daily
  #   #ここがよくわからない
  #   if params[:pre_preview].present?
  #     @target_month = Date.parse(params[:pre_preview]) << 1
  #   elsif params[:next_preview].present?
  #     @target_month = Date.parse(params[:next_preview]) >> 1
  #   else
  #     @target_month = Time.current.to_date << 1
  #   end

  #   @wo_ranks = Record
  #                 .joins(:workouts)
  #                 .select("records.member_id
  #                         ,sum(workouts.burned_calorie) as workout_calorie
  #                         ,to_char(records.date,'YYYY') as workout_year
  #                         ,to_char(records.date,'MM') as workout_month
  #                         ,to_char(records.date,'DD') as workout_day
  #                         ,round(sum(workouts.burned_calorie),1) as total_workout
  #                         ,RANK () OVER (PARTITION BY to_char(records.date,'YYYY'),to_char(records.date,'MM') ,to_char(records.date,'DD')
  #                                         order by (sum(workouts.burned_calorie) desc) as rank_number")
  #                 .where(study_date: @target_month.all_month)
  #                 .group("to_char(records.date,'YYYY')
  #                         ,to_char(records.date,'MM')
  #                         ,to_char(records.date,'DD')
  #                         ,record.member_id")
  #                 .order("(sum(workouts.burned_calorie))desc)")
  #   @my_rank = 0
  #   @wo_ranks.each do |wo_rank|
  #     if wo_rank.member_id == current_member.id
  #       @my_rank = wo_rank.rank_number
  #       break #breakとは？
  #     end
  #   end
  # end

  def monthly
  @members = []
  now = Time.current
  Member.all.each do |member|
  @workouts =  member.workouts.where(created_at:now.beginning_of_week..now.end_of_week)
  @members.push([member.name,@workouts.sum(:burned_calorie)])
  end
  #@members = Member.find(Workout.group(:burned_calorie).order('count(burned_calorie) desc').pluck(:member_id))
  end

end
