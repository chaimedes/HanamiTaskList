require 'features_helper'

describe 'Add a task' do
  after do
    TaskRepository.new.clear
  end

  it 'can create a new task' do
    visit '/tasks/new'
    within 'form#task-form' do
      fill_in 'Title', with: 'New Task'
      fill_in 'Description', with: 'Description'
      click_button 'Create'
    end

    current_path.must_equal('/tasks')
    assert page.has_content?('New task')
  end
end
