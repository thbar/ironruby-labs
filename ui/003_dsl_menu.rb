$LOAD_PATH << File.dirname(__FILE__)
require 'common'
require 'menu_builder'

form = Form.new

form.menu = MainMenu.build do
  item("&File") {
    item("&New") {
      item("Spreadsheet")
      item("Document")
    }
    item "&Quit", lambda { Application.Exit }
  }
  item("&Tools") {
    item "&PowerBlade", lambda { MessageBox.Show("Powerblades are amazing...") }
    item "&Scissors"
  }
end

Application.Run(form)
