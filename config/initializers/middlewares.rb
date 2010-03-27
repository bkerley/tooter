Dir.glob(Rails.root.join('app/middleware/*.rb')).each do |mw|
  require mw
end
