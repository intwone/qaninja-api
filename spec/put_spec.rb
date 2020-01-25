describe "put" do
  context "when a registered user" do
    before(:all) do
      originalUser = build(:registeredUser)
      token = ApiUser.token(originalUser.email, originalUser.password)
      @newUser = build(:user)
      @resultPut = ApiUser.update(token, originalUser.id, @newUser.toHash)
      @resultGet = ApiUser.find(token, originalUser.id)
    end

    it { expect(@resultPut.response.code).to eql "200" }
    it { expect(@resultGet.parsed_response["full_name"]).to eql @newUser.full_name }
    it { expect(@resultGet.parsed_response["email"]).to eql @newUser.email }
  end
end
