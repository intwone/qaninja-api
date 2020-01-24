describe "cadastro" do
  it "novo usuário" do
    result = HTTParty.post(
      "http://localhost:3001/user",
      body: {
        "full_name": "Cicero",
        "email": "cicero@gmail.com",
        "password": "cicero02",
      }.to_json,
      headers: {
        "Content-Type" => "application/json",
      },
    )
    expect(result.response.code).to eql "200"
  end
end
