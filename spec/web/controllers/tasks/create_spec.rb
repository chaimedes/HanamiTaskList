require 'spec_helper'
require_relative '../../../../apps/web/controllers/tasks/create'

describe Web::Controllers::Tasks::Create do
  let(:action) { Web::Controllers::Tasks::Create.new }
  let(:params) { Hash[task: { title: 'Learn Hanami'}] }
  let(:repository) { TaskRepository.new }

  before do
    repository.clear
  end

  it 'creates a new task' do
    action.call(params)
    task = repository.last
    task.id.wont_be_nil
    task.title.must_equal params.dig(:task, :title)
  end

  it 'redirects the user to the tasks listing' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/tasks'
  end
end
