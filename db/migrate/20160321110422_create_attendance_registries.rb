class CreateAttendanceRegistries < ActiveRecord::Migration
  def change
    create_table :attendance_registries do |t|
      t.references :section, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
