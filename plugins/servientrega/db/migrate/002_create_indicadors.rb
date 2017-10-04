class CreateIndicadors < ActiveRecord::Migration
  def change
    create_table :indicadors do |t|
      t.string :nombre
      t.string :meta
      t.string :proceso
      t.string :fuente
      t.string :propietario
      t.text :observaciones
    end
  end
end
