class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :title
      t.integer :content
    end
  end
end
