require "pg"

class Database
  def initialize
    dbConnection = { host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja" }
    @connection = PG.connect(dbConnection)
  end

  def findUser(email)
    query = "SELECT id, full_name, password, email, created_at, updated_at" \
            " FROM public.users WHERE email = '#{email}';"

    # first retorna a primeira posição do objeto
    @connection.exec(query).first
  end

  def deleteUser(email)
    query = "DELETE FROM public.users WHERE email = '#{email}';"
    @connection.exec(query)
  end
end
