class ApiUser
  include HTTParty
  base_uri "http://localhost:3001"
  headers "Content-Type" => "application/json"

  def self.token(userEmail, userPassword)
    result = post("/auth", body: { email: userEmail, password: userPassword }.to_json)

    # retorna somente o valor do token da rota /auth
    "JWT #{result.parsed_response["token"]}"
  end

  def self.save(user)
    post("/user", body: user.to_json)
  end

  def self.find(token, userId)
    get("/user/#{userId}", headers: { "Authorization" => token })
  end
end
