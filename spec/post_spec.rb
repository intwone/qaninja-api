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
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Oops. You entered a wrong email." }
  end

  context "when empty name" do
    before do
      @newUser = build(:emptyUserName).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Validation notEmpty on full_name failed" }
  end

  context "when empty email" do
    before do
      @newUser = build(:emptyUserEmail).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Validation notEmpty on email failed" }
  end

  context "when empty password" do
    before do
      @newUser = build(:emptyPassword).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Validation notEmpty on password failed" }
  end

  context "when duplicate email" do
    before do
      @newUser = build(:duplicateEmail).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "409" }
    it { expect(@result.parsed_response["msg"]).to eql "Oops. Looks like you already have an account with this email address." }
  end

  context "when null email" do
    before do
      @newUser = build(:nullEmail).toHash
      @result = ApiUser.save(@newUser)
    end

    it { expect(@result.response.code).to eql "412" }
    it { expect(@result.parsed_response["msg"]).to eql "Users.email cannot be null" }
  end
end
