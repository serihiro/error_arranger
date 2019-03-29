require 'spec_helper'

describe ErrorArranger do
  Request = Struct.new('Request',:env)

  class SuperMockController

    def request
      @req ||= Request.new({'action_dispatch.show_detailed_exceptions' => true})
    end

    def rescue_with_handler(exception)
      # do nothing
    end

    private
    def process_action(*args)
      raise 'error'
    end
  end

  class MockControllerWithArrangeException < SuperMockController
    include ActionController::Rescue

    def arrange_exception!(exception)
      exception.message << ':added message'
    end
  end

  class MockControllerWithoutArrangeException < SuperMockController
    include ActionController::Rescue
  end

  subject do
    mock_controller.send(:process_action, nil)
  end

  context 'when method arrange_exception! is defined in controller' do
    let(:mock_controller) { MockControllerWithArrangeException.new }

    it 'arrange_exception! called' do
      begin
        subject
      rescue => e
        expect(e.message).to eq 'error:added message'
      end
    end
  end

  context 'when method arrange_exception! is not defined in controller' do
    let(:mock_controller) { MockControllerWithoutArrangeException.new }

    it 'arrange_exception! will not be called' do
      begin
        subject
      rescue => e
        expect(e.message).to eq 'error'
      end
    end
  end
end
