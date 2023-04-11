require 'fastlane/action'
require_relative '../helper/fastgpt_helper'

module Fastlane
  module Actions
    class FastgptAction < Action
      def self.run(params)
        Actions.verify_gem!('openai')
        require 'openai'
        
        api_key = params[:api_key]
        changelog = params[:changelog]
        prompt = params[:prompt]
        
        UI.message("Running prompt: '" + prompt + "'")
        request = prompt + " " + changelog
        
        client = OpenAI::Client.new(access_token: api_key)
        
        response = client.chat(
            parameters: {
                model: "gpt-3.5-turbo",
                messages: [{ role: "user", content: request}]
            })
        
        response.dig("choices", 0, "message", "content")
        
      end

      def self.description
        "Use GPT API to generate content from Fastlane. Usable to generate release notes for TestFlight or AppStore"
      end

      def self.authors
        ["Marek Zvara"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
           FastlaneCore::ConfigItem.new(key: :api_key,
                                   env_name: "FASTGPT_API_KEY",
                                description: "Pass api key for Chat GPT",
                                       type: String,
                                        verify_block: proc do |value|
                                                    UI.user_error!("No api key") if value.to_s.length == 0
                                    end),
           FastlaneCore::ConfigItem.new(key: :changelog,
                                   env_name: "FASTGPT_CHANGELOG",
                                description: "Changelog, GPT will generate release notes from",
                                   optional: false,
                                       type: String,
                                        verify_block: proc do |value|
                                                    UI.user_error!("No changelog provided") if value.to_s.length == 0
                                    end),
            FastlaneCore::ConfigItem.new(key: :prompt,
                                    env_name: "FASTGPT_PROMPT",
                                 description: "Prompt, e.g. Create release notes for AppStore from: ",
                                    optional: false,
                                        type: String,
                                         verify_block: proc do |value|
                                                     UI.user_error!("No prompt provided") if value.to_s.length == 0
                                     end)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
