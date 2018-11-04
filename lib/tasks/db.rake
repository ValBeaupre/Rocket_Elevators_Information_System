require 'faker'
namespace :db do
  desc "TODO"
  task leads: :environment do
  end

  desc "TODO"
  task address: :environment do
  end

  desc "TODO"
  task customers: :environment do
  end

  desc "TODO"
  task buildings: :environment do
  end

  desc "TODO"
  task buildingsdetails: :environment do
  end

  desc "TODO"
  task batteries: :environment do
  end

  desc "TODO"
  task columns: :environment do
    Rake::Task['db:reset'].invoke
    i = 0
    1000.times do |n|
      batteryId =  i += 1
      Type = Faker::Lorem.word 
      Floors = 0+rand(50)
      Status = Faker::Lorem.word
      Information = Faker::Lorem.sentence
      Notes = Faker::Lorem.sentence
      Column.create!(:BatteryId => batteryId,
                    :Type => Type,
                    :Floors => Floors,
                    :Status => Status,
                    :Information => Information,
                    :Notes => Notes)
    end
  end

  desc "TODO"
  task elevators: :environment do
  end

end
