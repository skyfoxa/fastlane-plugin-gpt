require 'fastlane/action'
require_relative '../helper/gpt_helper'

module Fastlane
  module Actions
    class GptAction < Action
      def self.run(params)
        UI.message("The gpt plugin is working!")
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
        "Feed the lane with list of jira ticket titles or your technical changelog and generate human, fun release notes. You can specify the prompt so it's up to you what output you need."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GPT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
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
