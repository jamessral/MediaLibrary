class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|

      t.timestamps
    end
  end
end
