require 'rubygems'
require 'rspec'
require 'message_filter'

describe MessageFilter do
	share_examples_for 'MessageFilter with argument "foo"' do
		it do
			should be_detect('hello from foo')
		end
		it do
			should_not be_detect('hello, world!')
		end
		its(:ng_words) do should_not be_empty end
	end
	context  'with argument "foo"' do
		subject do MessageFilter.new('foo') end
		it_should_behave_like 'MessageFilter with argument "foo"'
		it do should have(1).ng_words end
	end
	context  'with argument "foo","bar"' do
		subject do MessageFilter.new('foo','bar') end
		it do
			should be_detect('hello from bar')
		end
		it_should_behave_like 'MessageFilter with argument "foo"'
		it do should have(2).ng_words end
	end
end
