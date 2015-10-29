module KITT
  class CommandsController < KITT::ApplicationController
    def highfive
      slug = case params[:channel_name]
             when "directmessage", "privategroup"
               SecureRandom.uuid
             else
               params[:channel_name]
             end

      user, domain = params[:user_name], params[:team_domain]

      render text: "Join #{user}'s :highfive: at: #{domain}.highfive.com/#{slug}"
    end
  end
end
