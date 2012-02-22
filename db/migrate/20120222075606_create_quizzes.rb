class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :number, null: false
      t.boolean :type, null: false
      t.binary :file, null:false
      t.string :ftype, null:false

      t.timestamps
    end

    add_index :quizzes, :file, unique: true
  end
end
