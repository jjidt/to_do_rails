class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :name, :varchar
      t.column :due, :date
    end
  end
end
