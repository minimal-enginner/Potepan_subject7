class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id:current_user.id)
    @rooms = Room.all
    @user = current_user
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.all
    @price = @room.find(@reservation.room_id).room_price_day
    if @reservation.person.nil? == true || @reservation.checkin.nil? ==true || @reservation.checkout.nil? == true
    flash[:notice_no_create] = "予約情報の登録に失敗しました"
    redirect_to controller: :rooms, action: :show, id: @reservation.room_id
    else 
      @sum_of_price = @price * @reservation.person
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.new
    if @reservation.save
      flash[:notice_create] = "予約情報を登録しました"
      redirect_to :reservations
    else
      flash[:notice_no_create] = "予約情報の登録に失敗しました"
      redirect_to controller: :rooms, action: :show, id: @reservation.room_id
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])

  end

  def edit
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:id])
  end

  def update
    @user = current_user
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice_update] = "予約情報を更新しました"
      redirect_to :reservations
    else
      flash[:notice_no_update] = "予約情報を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice_destroy] = "予約情報を削除しました"
    redirect_to :reservations
  end

   private
   def reservation_params  # プライベートメソッド 
     params.require(:reservation).permit(:checkin, :checkout, :person, :user_id, :room_id, :room_name, :sum_of_price)
   end
end
