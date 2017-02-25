class Restaurant
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
    location: "TEXT",
    owner_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  def owner
    sql = <<-SQL
      SELECT owners.* FROM owners
      WHERE restaurants.id = ?
    SQL
    self.class.db.execute(sql,self.owner_id)

# remember you placed the owner_id on the restaurants table, in the code you wrote, 
# I think you assumed the restaurant_id is on the owners table.
  end
end
