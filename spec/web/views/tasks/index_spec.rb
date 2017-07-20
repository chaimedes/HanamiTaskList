require 'spec_helper'
require_relative '../../../../apps/web/views/tasks/index'

describe Web::Views::Tasks::Index do
  let(:exposures) { Hash[tasks: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/tasks/index.html.erb') }
  let(:view)      { Web::Views::Tasks::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #tasks' do
    view.tasks.must_equal exposures.fetch(:tasks)
  end

  describe 'when there are no tasks' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are currently no tasks. Congratulations!</p>')
    end
  end

  describe 'when there are tasks' do
    let(:task1) { Task.new(title: 'Learn Hanami') }
    let(:task2) { Task.new(title: 'Update website') }
    let(:exposures) { Hash[tasks: [task1, task2]] }

    it 'lists them all' do
      rendered.scan(/class="task"/).count.must_equal 2
      rendered.must_include('Hanami')
      rendered.must_include('Update')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are currently no tasks. Congratulations!</p>')
    end
  end
end
