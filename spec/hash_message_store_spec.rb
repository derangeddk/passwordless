require_relative "../src/hash_message_store.rb"

RSpec.describe HashMessageStore do
  describe "#get_email_message" do
    it "returns an email message given to it in a hash" do
      store = HashMessageStore.new({
        :creation => {
          :subject => "Creation",
          :message => "Content..."
        }
      })

      msg = store.get_email_message(:creation)
      expect(msg[:subject]).to eq("Creation")
      expect(msg[:message]).to eq("Content...")
    end

    it "fails if a non-existing message is requested" do
      store = HashMessageStore.new({
        :creation => {
          :subject => "Creation",
          :message => "Content..."
        }
      })
      
      expect { store.get_email_message(:other) }.to raise_error
    end
  end
end
