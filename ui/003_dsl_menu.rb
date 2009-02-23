require File.dirname(__FILE__) + '/common'

# won't work - TODO - implement

menu = build_menu do
  menu "&File" do
    item("&New") { MessageBox.Show("Hello!") }
    item("&Quit") { Application.Exit }
  end
  menu "&Tools" do
    item "&PowerBlade"
    item "&Scissors"
  end
end

form = Form.new
form.menu = menu
Application.Run(form)
