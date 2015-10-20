FactoryGirl.define do
  factory(:question) do
    title("Just a question")
    text("As I said, just a question.")
  end

  factory(:user) do
    username("Milo")
    email("gmail@gmail.com")
    password("password")
  end
end
