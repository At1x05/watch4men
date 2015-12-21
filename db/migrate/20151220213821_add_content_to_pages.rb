class AddContentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :content_two, :text
    add_column :pages, :content_three, :text
  end
end
