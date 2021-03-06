Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'add_analysis_tab_to_admin_main_menu',
  insert_before: "erb[silent]:contains('if can? :admin, current_store')",
  text: <<-HTML
    <% if can? :admin, current_store %>
      <ul class="nav nav-sidebar border-bottom" id="sidebarAnalysis">
        <%= main_menu_tree Spree.t(:tab_heading, scope: [:analysis]), icon: "report.svg", sub_menu: "analysis", url: "#sidebar-analysis" %>
      </ul>
    <% end %>
  HTML
)
