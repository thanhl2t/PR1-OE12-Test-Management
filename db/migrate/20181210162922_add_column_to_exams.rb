class AddColumnToExams < ActiveRecord::Migration[5.1]
  def change
  	add_column :exams, :subject, :string
  	add_column :exams, :exam_name, :string
  	add_column :exams, :teacher, :string
  end
end
