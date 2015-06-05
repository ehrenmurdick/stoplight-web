class UserMapper < BaseMapper
  model User
  table :users

  def find_by_email email
    first table.where(table[:email].eq(email))
  end

  def reverse_map(user)
    {
      table[:email]         => user.email,
      table[:name]          => user.name,
      table[:password_hash] => user.password_hash,
    }
  end
end
