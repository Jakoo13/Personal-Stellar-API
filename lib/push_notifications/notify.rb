
module Push
    class Notify
      include HTTParty
      HEADERS = { "Authorization" => "Bearer NzE2YzZlMzgtMGYxZC00MGMwLWFmOTAtOWI4NjEwYWMzN2E3", "Content-Type" => "application/json" }
      # Create new file to storage log of pushes.
      @push_logger = ::Logger.new(Rails.root.join('log', 'push.log'))
      # Every request needs to inform the APP ID.
      @body =  {
        "app_id" => "e00d4c75-7ac6-4c3e-8589-9c124370b4fb"
      }
      def self.send_push(body, url)

        result = HTTParty.post url, headers: HEADERS, body: body, logger: @push_logger, log_level: :debug, log_format: :curl
        puts "RESULT:"
        puts result
      end
      # Send push to all users.
    #   def self.daily_news
    #     push_body = @body.merge(
    #       { 
    #         "included_segments" => ["All"],
    #         "url" => "https://onesignal.com",
    #         "data" => { "type": "daily_news" },
    #         "contents" => { "en" => "News!", "pt" =>  "Novidades!" }
    #       }).to_json
    #     send_push(push_body)
    #   end
      # Send push to specific user.
      def self.new_work_order(work_order)
        create_notification_url = "https://onesignal.com/api/v1/notifications"
        push_body = @body.merge(
          { 
            "include_external_user_ids" => [work_order.user_id.to_s],
            "contents" => { "en" => "You have received a new work order.", "pt" => "Você recebeu um novo comentário." }
          }).to_json
          puts "PUSH BODY:"
          puts push_body
        send_push(push_body, create_notification_url)
      end
    end
  end