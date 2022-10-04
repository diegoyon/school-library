require './app'

def main
  app = App.new
  app.load_data
  app.run
end

main
