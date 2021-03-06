require 'refinerycms-base'

module Refinery
  module Settings

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < ::Rails::Engine
      config.after_initialize do
        ::Refinery::Plugin.register do |plugin|
          plugin.name = "refinery_settings"
          plugin.url = {:controller => "/admin/refinery_settings"}
          plugin.version = %q{0.9.9}
          plugin.menu_match = /(refinery|admin)\/(refinery_)?settings$/
        end
      end
    end
  end
end

::Refinery.engines << 'settings'