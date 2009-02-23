require File.dirname(__FILE__) + '/common'

form = Form.new
form.menu = MainMenu.new
fileMenu = form.menu.menu_items.add("&File")

item = MenuItem.new("&New")
item.click do |s,args|
  MessageBox.Show("Oh, I'm clicked...")
end
fileMenu.menu_items.add(item)

item = MenuItem.new("&Quit")
item.click do |s,args|
  Application.Exit
end
fileMenu.menu_items.add(item)

Application.Run(form)
