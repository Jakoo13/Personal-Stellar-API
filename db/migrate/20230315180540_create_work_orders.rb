class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.string :title
      t.text :content
      t.string :work_type
      t.string :address
      t.datetime :appointment_time
      t.references :user, null: true, default: 0
      t.string :stage, default: "unassigned"
      t.timestamps
    end
  end
end
