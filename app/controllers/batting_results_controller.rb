class BattingResultsController < ApplicationController
  def index
    set_batting_results
    @batting_result = BattingResult.new
  end

  def create
    binding.pry
    @batting_result = BattingResult.new(batting_params)

    if overlapping == 1
      @batting_result.valid?
      @batting_result.save
      redirect_to action: :index
    else
      set_batting_results
      flash[:alert] = "空白もしく重複があります"
      render action: :index
    end
  end

  private
  
  def set_batting_results
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == current_team.id }[0]
    @home_order = @home_team.orders.where(team_id: @home_team.id, game_id: params[:game_id])
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != current_team.id }[0]
    @away_order = @away_team.orders.where(team_id: @away_team.id, game_id: params[:game_id])
    @batter = @home_order
  end

  def batting_params
    params.require(:batting_result).permit(:hit_id, :out_id, :time_base_id, :four_deadball_id, :point_id, :member_id, :order_id).merge(game_id: params[:game_id], team_id: params[:team_id])
  end

  def overlapping
    array = []
    array <<  @batting_result.hit_id
    array <<  @batting_result.out_id
    array <<  @batting_result.time_base_id
    array <<  @batting_result.four_deadball_id
    array_count = array.select{|num| num.present?}.count
    return array_count
  end
end
