describe Fastlane::Actions::GptAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The gpt plugin is working!")

      Fastlane::Actions::GptAction.run(nil)
    end
  end
end
