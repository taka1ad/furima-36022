class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :user, null:false, foreighn_key: true
      t.references :item, null:false, foreighn_key: true
      t.timestamps
    end
  end
end
