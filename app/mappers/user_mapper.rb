class UserMapper < BaseMapper
  model User
  table :users

  def find_by_email email
    first table.where(table[:email].eq(email))
  end
end
