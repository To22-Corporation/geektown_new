class Type::FormattedDate < ActiveRecord::Type::String
  def cast(value)
    if !value.kind_of?(String)
      "#{value.year}/#{format('%02d', value.month)}/#{format('%02d', value.day)}"
    else
      super
    end
  end
end
