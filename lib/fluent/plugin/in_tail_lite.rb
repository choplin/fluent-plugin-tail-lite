module Fluent
  class TailInputLite < Fluent::TailInput
    Fluent::Plugin.register_input('tail_lite', self)

    config_param :field_name,    :string, :default => 'message'

    def configure_parser(conf)
    end

    def parse_line(line)
      return Engine.now, {@field_name => line}
    end
  end
end
