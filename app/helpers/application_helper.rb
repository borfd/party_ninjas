require 'auto_html'
module ApplicationHelper
  AUTO_HTML_FORMAT = AutoHtml::Pipeline.new(
      AutoHtml::Markdown.new,
      AutoHtml::Image.new,
      AutoHtml::Link.new
  )
  def auto_html_for(text)
    AUTO_HTML_FORMAT.call(text)
  end
end
