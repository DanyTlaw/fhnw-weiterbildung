module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-error", alert: "alert-block", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  # Call this fuction with:
  # name: string to be displayd as link
  # f: the form object that contains the fields
  # association: the association to add
  # and an arbitrary number of html options for the link
  #
  # example: link_to_add_fields "Add Option", f, :options, class: 'btn'
  def link_to_add_fields(*args)
    options = args.extract_options!.symbolize_keys
    association = args.pop
    f = args.pop
    name = args.pop

    # create a new object of the given association class
    new_object = f.object.class.reflect_on_association(association).klass.new
    # get the associations form fields
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s, f: builder)
    end 

    #TODO: gsub seems to be the only funciton that escapes the string correctrly, .html_safe or h() are not working here, why?
    fields = fields.gsub('','')
    new_id = DateTime.now().strftime("%Y%m%d%H%S%L")
    options[:id] = "add_fields_#{new_id}"
    options[:name] = "add_fields"
    options[:href] = "#"
    options["data-blueprint-id"] = "blueprint_#{new_id}"
    options["data-field-id"] = "new_#{association}"
    link = content_tag("a", name, options)
    div = tag("div", data: {blueprint: fields}, hidden: true, id: "blueprint_#{new_id}")
    link + div
  end

  # Call this fuction with:
  # name: string to be displayd as link
  # f: the form object that contains the fields
  # and an arbitrary number of html options for the link
  #
  # example: link_to_remove_fields "Remove Option", f, class: 'btn'
  def link_to_remove_fields(*args)
    options = args.extract_options!.symbolize_keys
    f = args.pop
    name = args.pop

    destroy_field = f.hidden_field(:_destroy)

    new_id = DateTime.now().strftime("%Y%m%d%H%S%L")
    options[:id] = "remove_fields_#{new_id}"
    options[:name] = "remove_fields"
    options[:href] = "#"

    link = content_tag("a", name, options)
    destroy_field + link
  end
end