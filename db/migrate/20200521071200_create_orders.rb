class CreateOrders < ActiveRecord::Migration[6.0]

  def change

    create_table :orders do |t|

      t.datetime :date



      t.datetime :delivered_at



      t.integer :user_id

    end

  end

end
