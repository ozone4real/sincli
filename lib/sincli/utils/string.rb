class String
  def dash_case
    parameterize.dasherize
  end

  def snake_case
    parameterize.underscore
  end
end
