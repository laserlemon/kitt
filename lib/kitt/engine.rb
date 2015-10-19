module KITT
  class Engine < ::Rails::Engine
    isolate_namespace KITT

    initializer "inflections" do
      ActiveSupport::Inflector.inflections(:en) do |inflect|
        inflect.acronym "KITT"
      end
    end
  end
end
