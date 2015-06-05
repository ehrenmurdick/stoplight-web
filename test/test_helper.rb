ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
end

class FakeConnection
  attr_accessor :last_sql
  attr_accessor :results
  def execute(sql)
    self.last_sql = sql
    results
  end

  def insert_sql(sql)
    self.last_sql = sql
    results
  end
end

class FakeMapper
  attr_accessor :results
  def all; results; end
  def find(id); results; end
end

class FakeCrypto
  def initialize string
    @pwd = string
  end

  def ==(other)
    @pwd == other
  end
end
