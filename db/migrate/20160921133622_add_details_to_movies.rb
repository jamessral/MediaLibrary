class AddDetailsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :title, :string
    add_column :movies, :director, :string
    add_column :movies, :year, :integer
    add_column :movies, :format, :string
  end
end
