class AddColumncToOcrs < ActiveRecord::Migration[5.0]
  def change
    add_column :ocrs, :gen_text, :string
  end
end
