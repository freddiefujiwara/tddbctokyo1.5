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
	end
	context  'with argument "foo"' do
		subject do MessageFilter.new('foo') end
		it_should_behave_like 'MessageFilter with argument "foo"'
	end
	context  'with argument "foo","bar"' do
		subject do MessageFilter.new('foo','bar') end
		it do
			should be_detect('hello from bar')
		end
		it_should_behave_like 'MessageFilter with argument "foo"'
	end
end
