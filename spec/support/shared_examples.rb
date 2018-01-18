# below triggered with it_behaves_like in specs

shared_examples "require_sign_in" do
  it "redirects to the sign in page" do
    session[:user_id] = nil
    action # passed in from tests
    expect(response).to redirect_to login_path
  end
end

shared_examples "tokenable" do
  it "generates a random token when the user is created" do
    expect(object.token).to be_present
  end
end
