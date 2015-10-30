describe "/highfive" do
  UUID = /[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}/

  let(:slack) { double(Slack::Notifier, ping: nil) }

  before do
    allow(Slack::Notifier).to receive(:new) { slack }
  end

  context "from a channel" do
    it "generates a Highfive link named after the channel" do
      post "/kitt/highfive", {
        channel_id: "C123456789",
        channel_name: "water-cooler",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to be_blank

      expect(slack).to have_received(:ping).once.with(
        a_string_matching(/collectiveidea\.highfive\.com\/water-cooler/),
        a_hash_including(channel: "C123456789")
      )
    end
  end

  context "from a private channel/group" do
    it "generates a Highfive link using a random UUID" do
      post "/kitt/highfive", {
        channel_id: "C987654321",
        channel_name: "privategroup",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to be_blank

      expect(slack).to have_received(:ping).once.with(
        a_string_matching(/collectiveidea\.highfive\.com\/#{UUID}/),
        a_hash_including(channel: "C987654321")
      )
    end
  end

  context "from a direct message" do
    it "generates a Highfive link using a random UUID" do
      post "/kitt/highfive", {
        channel_id: "C246897531",
        channel_name: "directmessage",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to be_blank

      expect(slack).to have_received(:ping).once.with(
        a_string_matching(/collectiveidea\.highfive\.com\/#{UUID}/),
        a_hash_including(channel: "C246897531")
      )
    end
  end
end
