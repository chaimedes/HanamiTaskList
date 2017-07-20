require 'features_helper'
describe 'List Tasks' do
  let(:repository) { TaskRepository.new }
  before do
    repository.clear
    repository.create(title: 'Learn Hanami')
    repository.create(title: 'Update webasite')
  end
  it 'displays each task item on the page' do
    visit '/tasks'
    within '#tasks' do
      assert page.has_css?('.task', count: 2), 'Expected to find 2 tasks'
    end
  end
end
