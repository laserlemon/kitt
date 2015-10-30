module KITT
  class CommandsController < KITT::ApplicationController
    def highfive
      slug = case params[:channel_name]
             when "directmessage", "privategroup"
               SecureRandom.uuid
             else
               params[:channel_name]
             end

      url = "#{params[:team_domain]}.highfive.com/#{slug}"
      text = "Join <@#{params[:user_name]}>'s call at: <https://#{url}|#{url}>"

      slack.ping(text, {
        channel: params[:channel_id],
        icon_emoji: ":highfive:",
        username: "Highfive"
      })

      head :ok
    end

    private

    def slack
      @slack ||= Slack::Notifier.new(ENV["KITT_INCOMING_WEBHOOK_URL"])
    end
  end
end
