class OrdersController < ApplicationController
  before_action :authenticate_team!
  before_action :team_match

  def new
    order_set           # order_setで 変数をセット
    @order = Order.new()
  end

  def create
    position_blank = params[:position_id].map{|n| n.present? }
    member_blank = params[:member_id].map{|n| n.present?}

    if position_blank.include?(false) && member_blank.include?(false) 
      order_set            # order_setで 変数をセット
      flash[:alert] = "オーダーの空白は保存できません！"
      redirect_to action: :new
    else
      @order = order_params
      9.times do | i | 
        order = Order.new(batting_order: @order[:batting_order][i], game_id: @order[:game_id], team_id: @order[:team_id], member_id: @order[:member_id][i],  position_id: @order[:position_id][i])
        order.save
        i += 1
      end
      flash[:notice] = "オーダーが保存されました！！"
      redirect_to controller: :games, action: :index
    end

  end

  def show
    order_set            # order_setで 変数をセット
    @order = @home_team.orders.where(game_id: @game.id)
  end

  def destroy
    order_ids = Order.where(team_id: params[:team_id], game_id: params[:game_id])
    order_ids.each do | order_id |
      order = Order.find(order_id.id)
      order.destroy
    end
    flash[:alert] = "オーダーを削除しました"
    redirect_to team_games_path(params[:team_id])
  end

  private
  def team_match
    redirect_to root_path unless current_team.id == params[:team_id].to_i
  end

  def order_set
    @game = Game.find(params[:game_id])
    @teams = @game.teams.includes(:members)
    @home_team = @teams.select{|team| team.id == params[:team_id].to_i }[0]
    @home_team_mem = @home_team.members
    @away_team = @teams.select{|team| team.id != params[:team_id].to_i }[0]
  end

  def order_params
      params.permit(:game_id, :team_id).merge(batting_order: params[:batting_order],position_id: params[:position_id], member_id: params[:member_id])
  end

end
