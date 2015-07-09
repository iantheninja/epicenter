module ApplicationHelper
  def flash_notice(flash, &block)
    flash_class = 'alert alert-success' if flash[:notice]
    flash_class = 'alert alert-danger'  if flash[:alert]
    content_tag(:div, class: flash_class, &block)
  end

  def hide_navbar
    current_page?(new_code_of_conduct_path) ||
    current_page?(new_refund_policy_path) ||
    current_page?(new_enrollment_agreement_path) ||
    current_page?(new_promissory_note_path) ||
    current_page?(recurring_payments_option_index_path) ||
    current_page?(certificate_path) ||
    current_page?(transcript_path) ||
    current_page?(attendance_path)
  end
end
