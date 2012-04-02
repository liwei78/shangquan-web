namespace(:daily) do
  
  desc "Clear All PhotoTemp Files for Item Uploads"
  task(:clear_photo_temp => :environment) do
    PhotoTemp.destroy_all
  end
  
end