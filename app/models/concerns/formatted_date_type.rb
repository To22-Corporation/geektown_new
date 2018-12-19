class FormattedDateType < ActiveRecord::Type::String
  def cast(value)
    if !value.nil? && value.class == Time
      "#{value.year}/#{format('%02d', value.month)}/#{format('%02d', value.day)}"
    else
      super
    end
  end
end
