describe "/highfive" do
  UUID = /[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}/

  context "from a channel" do
    it "generates a Highfive link named after the channel" do
      post "/kitt/highfive", {
        channel_name: "water-cooler",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to eq(
        "Join steve's :highfive: at: collectiveidea.highfive.com/water-cooler"
      )
    end
  end

  context "from a private channel/group" do
    it "generates a Highfive link using a random UUID" do
      post "/kitt/highfive", {
        channel_name: "privategroup",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to match(
        /Join steve's :highfive: at: collectiveidea\.highfive\.com\/#{UUID}/
      )
    end
  end

  context "from a direct message" do
    it "generates a Highfive link using a random UUID" do
      post "/kitt/highfive", {
        channel_name: "directmessage",
        team_domain: "collectiveidea",
        user_name: "steve"
      }

      expect(response.status).to eq(200)
      expect(response.body).to match(
        /Join steve's :highfive: at: collectiveidea\.highfive\.com\/#{UUID}/
      )
    end
  end
end
