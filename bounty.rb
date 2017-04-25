require ('pg')

class Bounty

  attr_accessor :name, :species, :danger_level, :homeworld
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @species = params['species']
    @danger_level = params['danger_level']
    @homeworld = params['homeworld']
  end

  def save 
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "INSERT INTO bounty (name, species, danger_level, homeworld)
    VALUES ('#{@name}', '#{species}', '#{danger_level}', '#{homeworld}') RETURNING *;"

    @id = db.exec(sql).first()['id'].to_i
    db.close() 
  end

  def Bounty.all()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM bounty;"
    result = db.exec(sql)
    db.close()
    return result.map {|bounty_hash| Bounty.new(bounty_hash)}
  end

  def delete
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bounty WHERE id = #{@id};"
    db.exec(sql)
    db.close()
  end

  def Bounty.delete_all
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bounty;"
    db.exec(sql)
    db.close()
  end

  def update
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "UPDATE bounty 
    SET (name, species, danger_level, homeworld) =
    ('#{@name}', '#{species}', '#{danger_level}', '#{homeworld}')
    WHERE id = #{@id};"
    db.exec(sql)
    db.close()
  end

  def Bounty.find
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM bounty WHERE homeworld = 'Mars';"
    result = db.exec(sql)
    db.close()
    return result.map {|bounty_hash| Bounty.new(bounty_hash)}
  end

end
