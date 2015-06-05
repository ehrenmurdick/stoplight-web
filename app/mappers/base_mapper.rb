class BaseMapper
  attr_accessor :connection
  attr_accessor :insert_manager
  def initialize
    self.connection     = ActiveRecord::Base.connection
    self.insert_manager = Arel::InsertManager.new(ActiveRecord::Base)
  end

  def self.model m
    define_method(:model) { m }
  end

  def self.table t
    define_method(:table) { Arel::Table.new(t) }
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
