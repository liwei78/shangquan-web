namespace(:db) do
  desc "rebuild all db migrations"
  task(:rebuild => :environment) do
    exec "rake db:drop"
    exec "rake db:create"
    exec "rake db:migrate"
    exec "rake db:seed"
  end
end