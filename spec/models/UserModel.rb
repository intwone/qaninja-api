class UserModel
  attr_accessor :full_name, :email, :password

  def toHash
    {
      full_name: @full_name,
      email: @email,
      password: @password,
    }
  end
end
