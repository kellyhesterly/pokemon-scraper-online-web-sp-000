class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
    sql = <<-SQL
    INSERT INTO pokemons (name, type) VALUES (?, ?)
    SQL
    db.exeute(sql)
    @id = db.execute("SELECT last_insert_rowid FROM pokemons")
  end
end
