class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string  :postal,        nill: false
      t.integer :prefecture_id, nill: false
      t.string  :city,          nill: false
      t.string  :address,       nill: false
      t.string  :building_name
      t.string  :tell_number,   nill: false
      t.timestamps
    end
  end
end


