Rails.application.config.to_prepare do
  RailsAdmin::Config::HasFields.module_eval do
    attr_reader :template

    def set_template(name)
      @template ||= name
    end
  end
end
