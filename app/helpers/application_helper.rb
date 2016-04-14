module ApplicationHelper
  def body_container_div(&block)
    content = block_given? ? capture(&block) : ''.html_safe
    div_class = "container #{action_name}-#{controller_name}-container"
    content_tag(:div, content, class: div_class, id: "body_container")
  end
end
