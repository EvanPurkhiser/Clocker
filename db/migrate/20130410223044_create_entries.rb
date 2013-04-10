class CreateEntries < ActiveRecord::Migration
  def change
    create_table  :entries do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.text      :description
      t.integer   :project_id

      t.timestamps
    end
  end
end
