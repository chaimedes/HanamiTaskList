require 'spec_helper'
require_relative '../../../../apps/web/controllers/tasks/new'

describe Web::Controllers::Tasks::New do
  let(:action) { Web::Controllers::Tasks::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
