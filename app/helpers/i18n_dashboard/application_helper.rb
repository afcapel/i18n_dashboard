module I18nDashboard
  module ApplicationHelper
    def title(page_title, show_title = true)
      @show_title = show_title
      if @show_title
        content_for(:title) { h(page_title.to_s) }
      end
    end

    def show_title?
      @show_title
    end
  end
end
