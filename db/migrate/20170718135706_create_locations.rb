class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
    	t.integer  :user_id
		t.string   :share_type
    	t.string   :coordinates
        t.timestamps
    end
  end
end
