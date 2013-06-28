class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :grading_type

      t.timestamps
    end
  end
end
