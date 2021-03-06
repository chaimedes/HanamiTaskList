require 'spec_helper'
require_relative '../../../../apps/web/controllers/tasks/index'

describe Web::Controllers::Tasks::Index do
  let(:action) { Web::Controllers::Tasks::Index.new }
  let(:params) { Hash[] }
  let(:repository) { TaskRepository.new }

  before do
    repository.clear
    @task = repository.create(title: 'Learn Hanami', importance: '1')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all tasks' do
    action.call(params)
    action.exposures[:tasks].must_equal [@task]
  end
end
