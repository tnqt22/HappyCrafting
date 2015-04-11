class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :user
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
