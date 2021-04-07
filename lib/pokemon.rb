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
    INSERT INTO pokemon (name, type, db) VALUES (?, ?)
    SQL
    db.exeute(sql)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
end
