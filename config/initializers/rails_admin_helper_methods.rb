Rails.application.config.to_prepare do
  RailsAdmin::ApplicationHelper.module_eval do
    def template_dom_id(field, options)
      (@dom_id ||= {})[field.name] ||=
          [
            @object_name.to_s.gsub(/\]\[|[^-a-zA-Z0-9:.]/, '_').sub(/_$/, ''),
            options[:index],
            field.method_name,
          ].reject(&:blank?).join('_')
    end

    def template_errors_for(field)
      field.errors.present? ? content_tag(:span, field.errors.to_sentence, class: 'help-inline text-danger') : ''.html_safe
    end

    def template_help_for(field)
      field.help.present? ? content_tag(:span, field.help, class: 'help-block') : ''.html_safe
    end

    def template_css(field)
      "form-group control-group #{field.type_css_class} #{field.css_class} #{'error' if field.errors.present?}"
    end

    def compact_render_field(field)
      field.read_only? ? content_tag(:div, field.pretty_value, class: 'form-control-static') : field.render_compact
    end

    def template_field(fields, name)
      fields.select {|f| f.method_name == name }.first
    end

    def config_template(fields, options)
      self.define_singleton_method(:for_field) do |field_name, &block|
        field = template_field(fields, field_name)
        css   = template_css(field)
        id    = "#{template_dom_id(field, options)}_field"
        label = label(field_name, capitalize_first_letter(field.label), class: 'control-label')
        block.call(field, css, id, label)
      end
    end

    def config_show_template(fields)
      self.define_singleton_method(:for_field) do |field_name, &block|
        field = template_field(fields, field_name)
        css   = "#{field.type_css_class} #{field.css_class}"
        id    = "#{field_name.to_s}_id"
        label = field.label
        value = field.pretty_value
        value = '<Undefined>' if value.kind_of?(Array) && value.empty?
        block.call(field, css, id, label, value)
      end
    end
  end
end
