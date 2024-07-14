class CreateDailyOverviews < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_overviews do |t|
      t.date :date

      t.timestamps
    end
  end
end
