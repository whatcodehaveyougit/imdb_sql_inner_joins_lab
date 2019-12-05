require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

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


end
