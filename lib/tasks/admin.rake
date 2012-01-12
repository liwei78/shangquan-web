require 'tool_box'

namespace(:admin) do
  desc "account and password"
  task(:hi => :environment) do
    ToolBox.adminnow
  end
  
end