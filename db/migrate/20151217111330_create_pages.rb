class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :short_content_text
      t.text :tags
      t.text :description

      t.timestamps null: false
    end
  end
end
