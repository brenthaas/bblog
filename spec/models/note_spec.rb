require 'spec_helper'

describe Note do
  let (:note) { Notes.create!(
                    title: "Test",
                    content: "This is where interesting notes go"
              )}
  describe "verifications" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
  end
end
