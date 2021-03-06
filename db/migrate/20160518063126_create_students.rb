class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :studentid
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :students, :email

    add_index :courses_students, [:course_id, :student_id]
  end
end
