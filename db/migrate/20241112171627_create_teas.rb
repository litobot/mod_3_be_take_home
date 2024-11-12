class CreateTeas < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.integer :temperature
      t.float :brew_time  # Might end up changing to integer and just use seconds

      t.timestamps
    end
  end
end
