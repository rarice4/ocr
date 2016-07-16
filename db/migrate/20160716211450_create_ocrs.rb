class CreateOcrs < ActiveRecord::Migration[5.0]
  def change
    create_table :ocrs do |t|
      t.string :image_ref

      t.timestamps
    end
  end
end
