class AddPhotoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :photo, :string
  end
end
