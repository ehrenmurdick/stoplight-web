class BaseMapper
  attr_accessor :connection
  attr_accessor :insert_manager_class
  attr_accessor :update_manager_class

  def initialize
    self.connection           = ActiveRecord::Base.connection
    self.insert_manager_class = Arel::InsertManager
    self.update_manager_class = Arel::UpdateManager
  end

  def self.model m
    define_method(:model) { m }
  end

  def self.table t
    define_method(:table) { Arel::Table.new(t) }
  end

  def create_insert_manager
    insert_manager_class.new(ActiveRecord::Base)
  end

  def create_update_manager
    update_manager_class.new(ActiveRecord::Base)
  end

  def insert model
    return false if model.id
    insert_manager = create_insert_manager
    insert_manager.into(table)
    insert_manager.insert(reverse_map(model))
    model.id = connection.insert_sql insert_manager.to_sql
    return true
  end

  def update model
    return false unless model.id
    update_manager = create_update_manager
    update_manager.table(table).where(table[:id].eq(model.id))
    update_manager.set(reverse_map(model))
    connection.execute(update_manager.to_sql)
    return true
  end

  def find i
    first table.where(table[:id].eq(i))
  end

  def all
    query table
  end

  def first q = table
    query(q.take(1)).first
  end

  def query arel
    map(connection.execute(arel.project(Arel.star).to_sql))
  end

  def map(results)
    results.map do |row|
      model.new(row)
    end
  end
end
