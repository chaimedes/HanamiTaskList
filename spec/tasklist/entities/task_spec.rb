require 'spec_helper'

describe Task do
  it 'can be initialized with attributes' do
    task = Task.new(title: 'Learn Hanami')
    task.title.must_equal 'Learn Hanami'
  end
end
