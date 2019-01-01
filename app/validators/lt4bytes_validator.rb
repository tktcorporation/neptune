class Lt4bytesValidator < ActiveModel::EachValidator
  # UTF-8で4バイト以上の文字かを判定する
  def validate_each(record, attribute, value)
    return if value.blank?
    unavailable_chars = value.scan(/[^\u0000-\uFFFF]/)
    record.errors.add(attribute, :unavailable, chars: unavailable_chars.uniq.join(', ')) if unavailable_chars.present?
  end
end