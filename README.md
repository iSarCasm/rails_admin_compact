# RailsAdminCompact
Adds Template system as well compact version of built-in field renderers of Rails Admin

## To specify the template for the RailsAdmin section do
```ruby
rails_admin do
  update do
    set_template 'my_template'
  end
end
```

## To add a new template
Create new view under `app/views/rails_admin/main/templates/_my_template.html.haml`
With contents similar to:
```ruby
-# DO NOT REMOVE THAT LINE
- config_template(fields, options)

-# For field render you can use compact_render_field(field) or field.render
.clearfix
  - for_field :hotel_id do |field, css, id, label|
    %div{class: "col-md-3 #{css}", id: id}
      %p
        = label
      = compact_render_field field
```

**Note:** DONT REMOVE FIRST LINE
**Note:** You can use both `compact_render_field field` or `field.render`
