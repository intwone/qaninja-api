describe "post" do
  context "when new user" do
    # let só será chamado quando o objeto "result" for chamado dentro do expect
    # let(:newUser) { build(:user).toHash } objeto utilizado diretamente no method "save"
    let(:result) { ApiUser.save(build(:user).toHash) }

    it { expect(result.response.code).to eql "200" }
  end

  context "when wrong email" do
    let(:result) { ApiUser.save(build(:userWrongEmail).toHash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end

  context "when empty name" do
    let(:result) { ApiUser.save(build(:emptyUserName).toHash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
  end

  context "when empty email" do
    let(:result) { ApiUser.save(build(:emptyUserEmail).toHash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
  end

  context "when empty password" do
    let(:result) { ApiUser.save(build(:emptyPassword).toHash) }

    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
  end

  context "when duplicate email" do
    let(:result) { ApiUser.save(build(:registeredUser).toHash) }

    it { expect(result.response.code).to eql "409" }
    it { expect(result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
  end

  context "when null email" do
    let(:result) { ApiUser.save(build(:nullEmail).toHash) }
    it { expect(result.response.code).to eql "412" }
    it { expect(result.parsed_response["msg"]).to eql "Users.email cannot be null" }
  end
end
