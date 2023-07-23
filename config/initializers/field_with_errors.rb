# костыль, чтобы не создавался div.field_with_error в месте невалидных полей формы,
# съезжает поле с указанием минимального количества символов пароля

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  "#{html_tag}".html_safe
end