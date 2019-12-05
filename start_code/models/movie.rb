require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

# Create
  def save()
    sql = "INSERT into movies
    ( title,
      genre
      )
      VALUES (
        $1, $2
        ) RETURNING id"
    values = [@title, @genre]
    # Getting the ID Key
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

# Read

def self.all()
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  return movies.map { |movies| Movie.new(movie)}
end

# Update
def update()
  sql = "UPDATE movies SET title = $1 WHERE id = $2"
  values = [@title, @id]
  SqlRunner.run(sql, values)
    return values
end

# Delete ALL
  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  # Delete Just One!!

def delete()
  sql = "DELETE FROM movies where id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end




end
