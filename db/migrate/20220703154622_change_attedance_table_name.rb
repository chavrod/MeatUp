class ChangeAttedanceTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :attendance_record, :attendance_records
  end
end
