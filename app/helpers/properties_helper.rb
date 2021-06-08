module PropertiesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_properties_path
    elsif action_name == 'edit'
      property_path
    end
  end
end
