class Review 
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    customer_id: "INTEGER",
    restaurant_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  

  def customer
    sql = <<-SQL
      SELECT customers.* FROM customers
      INNER JOIN reviews ON customers.id = reviews.customer_id
      WHERE reviews.id = ?
    SQL
    self.class.db.execute(sql,self.id)
  end

  def restaurant
    sql = <<-SQL 
      SELECT restaurants.* FROM restaurants
      INNER JOIN reviews ON restaurants.id = reviews.restaurant_id
      WHERE reviews.id = ?
    SQL
    self.class.db.execute(sql,self.id)
  end
# perfect.

end

