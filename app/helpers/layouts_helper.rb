module LayoutsHelper

  def title(page_title, show_title = true)
    content_for(:title) { "A&Y | #{page_title.to_s}" }
  end

  def body_class(body_class)
    content_for(:body_class) { "class=#{body_class.to_s}" }
  end

  def stylesheet(*args)
    content_for(:stylesheets) { stylesheet_link_tag(*args) }
  end

  def javascripts(*args)
    content_for(:javascripts) { javascript_include_tag(*args) }
  end

  def current_tab(tab_name, complex=false)
    CurrentTab.set_tab(tab_name, controller.action_name, controller.controller_path, "current", complex)
  end

end