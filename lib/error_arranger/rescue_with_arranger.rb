module ActionController
  module Rescue
    extend ActiveSupport::Concern
    include ActiveSupport::Rescuable

    private
      def process_action(*args)
        super
      rescue Exception => exception
        request.env['action_dispatch.show_detailed_exceptions'] ||= show_detailed_exceptions?
        arrange_exception!(exception) if self.respond_to?(:arrange_exception!)
        rescue_with_handler(exception) || raise(exception)
      end
  end
end
