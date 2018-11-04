require 'pg'
require 'date'

namespace :export do
    desc "launch all export task"
    task dwh: :environment do
        Rake::Task["export:factquotes"].invoke
        Rake::Task["export:factcontact"].invoke
        Rake::Task["export:factelevator"].invoke
        Rake::Task["export:dimcustomers"].invoke
        
    end


    # FactQuotes
    desc "export data from mysql database to postgresql table FactQuotes"
    task factquotes: :environment do
        table = Quote.all
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

        conn.exec("TRUNCATE \"FactQuotes\" RESTART IDENTITY")

        table.each do |row|
            if row.nb_shafts == nil then
                row.nb_shafts = 0
            end

            date = row.created_at.strftime("%Y%m%d")

            conn.exec("INSERT INTO \"FactQuotes\" (\"QuoteId\", \"CreationDate\", \"Business\", \"Email\", \"NbElevators\") VALUES (#{row.id}, '#{date}', \'#{row.business}\', \'#{row.email}\', #{row.nb_shafts})")
        end
        conn.finish()
    end


    # FactContact
    desc "export data from mysql database to postgresql table FactContact"
    task factcontact: :environment do
        table = Lead.all
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

        conn.exec("TRUNCATE \"FactContact\" RESTART IDENTITY")

        table.each do |row|
            date = row.created_at.strftime("%Y%m%d")
            conn.exec("INSERT INTO \"FactContact\" (\"ContactId\", \"CreationDate\", \"Business\", \"Email\", \"ProjectName\") VALUES (#{row.id}, '#{date}', '#{row.Business.gsub("'", "''")}', \'#{row.Email}\', \'#{row.Project_Name}\')")
        end
        conn.finish()
    end


    # FactElevator
    desc "export data from mysql database to postgresql table FactElevator"
    task factelevator: :environment do
        table = Elevator.all
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

        conn.exec("TRUNCATE \"FactElevator\" RESTART IDENTITY")

        table.each do |row|
            # Path to add ramdom date to nil field
            if row.Start_date == nil then
                Year = 1976+rand(42)
                Month = 1+rand(11)
                Day = 1+rand(27)
                date = Date.new(Year, Month, Day)
                date = date.strftime("%Y%m%d")
            else
                date = row.Start_date.strftime("%Y%m%d")
            end
            conn.exec("INSERT INTO \"FactElevator\" (\"ElevatorId\", \"SerialNumber\", \"Commissioning\", \"BuildingId\", \"CustomerId\", \"City\") VALUES (#{row.id}, '#{row.Serial_number}', '#{date}', #{-1}, #{-1}, 'City')")
        end
        conn.finish()
    end

    # DimCustomers
    desc "export data from mysql database to postgresql table DimCustomers"
    task dimcustomers: :environment do
        table = Customer.all
        conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

        conn.exec("TRUNCATE \"DimCustomers\" RESTART IDENTITY")

        table.each do |row|
            # nbelevators = Elevator.joins(column: {battery: {building: :customer}}).where("customers.id = #{c.id}").count # The magic command adapted to the Jabir's team. But inadequate for us; must be adapted to fit our database
            nbelevators = 1+rand(50)
            
            # Path to add ramdom date to nil field
            if row.Creation_date == nil then
                Year = 1976+rand(42)
                Month = 1+rand(11)
                Day = 1+rand(27)
                date = Date.new(Year, Month, Day)
                date = date.strftime("%Y%m%d")
            else
                date = row.Creation_date.strftime("%Y%m%d")
            end
            city = "#{row.Business.gsub("'", "''")} City"
            conn.exec("INSERT INTO \"DimCustomers\" (\"Creationdate\", \"Business\", \"ContactFullName\", \"ContactEmail\", \"NbElevators\", \"City\") VALUES ('#{date}', '#{row.Business.gsub("'", "''")}', '#{row.Contact_full_name.gsub("'", "''")}', '#{row.Contact_email}', #{nbelevators}, \'#{city}\')")
        end
        conn.finish()
    end 
end
