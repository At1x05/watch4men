class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :header
      t.string :sub_header
      t.text :short_description
      t.text :box_one
      t.text :box_two
      t.string :cto_button

      t.timestamps null: false
    end
  end
end
