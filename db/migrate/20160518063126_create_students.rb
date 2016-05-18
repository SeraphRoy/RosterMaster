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

    create_table :courses_students, :id => false do |t|
      t.integer :course_id
      t.integer :student_id
    end

    add_index :courses_students, [:course_id, :student_id]
  end
end
