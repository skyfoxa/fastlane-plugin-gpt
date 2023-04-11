# gpt plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-gpt)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-gpt`, add it to your project by running:

```bash
fastlane add_plugin gpt
```

## About gpt

Use GPT API to generate content from Fastlane. Usable to generate release notes for TestFlight or AppStore

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```ruby
lane :notes do |options|
    version = "2.6.0 (2)" # specify the app version and build number
    plain_notes = "[PA-1234] Main tab screen title updated" # provide technical changelog

    release_notes = gpt(
                   api_key: ENV["GPT_KEY"], # you need to generate GPT token and past it here
                   prompt: "Create human, non-technical and funny release notes for iOS production app #{version} deployed to TestFlight",
                   changelog: plain_notes
                )
    puts release_notes
  end
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
