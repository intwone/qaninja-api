describe "get" do
  context "when a registered user" do
    let (:user) { build(:registeredUser) }
    let (:token) { ApiUser.token(user.email, user.password) }
    let (:result) { ApiUser.find(token, user.id) }
    let (:userData) { Database.new.findUser(user.email) }

    it { expect(result.response.code).to eql "200" }
    it { expect(result.parsed_response["full_name"]).to eql userData["full_name"] }
    it { expect(result.parsed_response["password"]).to eql userData["password"] }
    it { expect(result.parsed_response["email"]).to eql userData["email"] }
    it { expect(Time.parse(result.parsed_response["createdAt"])).to eql Time.parse(userData["created_at"]) }
    it { expect(Time.parse(result.parsed_response["updatedAt"])).to eql Time.parse(userData["updated_at"]) }
  end
end
