describe "get" do
  context "when a registered user" do
    let (:user) { build(:registeredUser) }
    let (:token) { ApiUser.token(user.email, user.password) }
    let (:result) { ApiUser.find(token, user.id) }

    it { expect(result.response.code).to eql "200" }
  end
end
