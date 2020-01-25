require "pg"

class Database
  def initialize
    dbConnection = { host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja" }
    @connection = PG.connect(dbConnection)
  end

  def deleteUser(email)
    query = "DELETE FROM public.users WHERE email = '#{email}';"
    @connection.exec(query)
  end
end
