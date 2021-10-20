class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.boolean :is_finished
      t.integer :user_id

      t.timestamps
    end
  end
end
