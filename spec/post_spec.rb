describe "post" do
  context "when new user" do
    before do
      @newUser = build(:user).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "200" }
  end

  context "when wrong email" do
    before do
      @newUser = build(:userWrongEmail).toHash

      @result = HTTParty.post(
        "http://localhost:3001/user",
        body: @newUser.to_json,
        headers: {
          "Content-Type" => "application/json",
        },
      )
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end
end
