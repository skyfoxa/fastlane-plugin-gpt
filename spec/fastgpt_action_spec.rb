describe Fastlane::Actions::FastgptAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The fastgpt plugin is working!")

      Fastlane::Actions::FastgptAction.run(nil)
    end
  end
end
