module HomeHelper
    
    def title(name, show_title = true)
        @show_title = show_title
        content_for(:title) do
            name
        end
    end
    
    def nav_link(text, path)
        if current_page?(path)
            content_tag :li, class: "nav-items active" do
                link_to(path, class: "nav-link") do
                    sanitize(text) + content_tag(:span, "(current)", class: "sr-only")
                end
            end
        else
            content_tag :li, class: "nav-items" do
                link_to(text, path, class: 'nav-link')
            end
        end
    end
    
end
