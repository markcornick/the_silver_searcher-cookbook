require 'spec_helper'

usage = /Usage: ag \[FILE-TYPE\] \[OPTIONS\] PATTERN \[PATH\]/

describe command('/usr/local/bin/ag --help') do
  describe 'its standard output' do
    subject { super().stdout }
    it { is_expected.to match(usage) }
  end
end
