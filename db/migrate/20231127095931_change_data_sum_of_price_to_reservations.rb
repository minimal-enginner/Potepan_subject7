class ChangeDataSumOfPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :sum_of_price, :integer
  end
end
