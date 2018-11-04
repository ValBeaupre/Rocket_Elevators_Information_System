require 'faker'
require 'date'
i = 0
1000.times do |n|
        Email = Faker::Internet.email
        Title = Faker::Lorem.word 
        First = Faker::Name.first_name
        Last = Faker::Name.last_name
  batteryId =  i += 1
  AddressA = Faker::Address.street_address
  Name = Faker::Name.name
  City = Faker::Address.city
  Secondary_Address = Faker::Address.secondary_address
  Street = Faker::Address.street_name
  Business = Faker::Company.name
  Email = Faker::Internet.email
  Phone = Faker::PhoneNumber.phone_number
  Years = 1976+rand(42)
  Year = 2015+rand(3)
  Month = 1+rand(11)
  Day = 1+rand(28)
  d = Date.new(Years, Month, Day)
  c = Date.new(Year, Month, Day)
  d.strftime("%F")
  c.strftime("%F")
  Type = Faker::Lorem.word 
  Floors = 0+rand(50)
  Status = Faker::Lorem.word
  Information = Faker::Lorem.sentence
  Notes = Faker::Lorem.sentence
  Test = rand(4)
  if (Test != 1) then
    Information = ""
  end

  Lead.create(:Full_name => Name,
    :Business => Business,
    :Email => Email,
    :Phone => Phone,
    :Project_Name => Type,
    :Description => Information,
    :Department => Status,
    :Message => Information,
    :created_at => c)

  user = User.first

  user = User.create(email: "tes@test.com") unless user.nil?

  employee = Employee.create(
    :first_name => First,
    :last_name => Last,
    :title => Title,
    :email => Email,
) 

  customer = Customer.create!(:user_id =>  1,
    :Creation_date => d,
    :Business => Business,
    :Headquarter => AddressA,
    :Contact_full_name => Name,
    :Contact_phone => Phone,
    :Contact_email => Email,
    :Business_description => Notes,
    :Tech_full_name => Name,
    :Tech_phone => Phone,
    :Tech_email => Email, 
    :created_at => c)

  building  = Building.create!(:customer_id =>  customer.id,
    :Address => Type,
    :Admin_Full_Name => Name,
    :Admin_email => Email,
    :Admin_Phone => Phone,
    :Tech_Full_Name => Name,
    :Tech_email => Email,
    :Tech_Phone => Phone,
    :created_at => c)


  battery = Battery.create!(:building_id =>  building.id,
    :Type => Type,
    :Status => Status,
    :employee_id => employee.id,
    :Commissioning => Type,
    :Last_Inspection => Years,
    :Information => Notes,
    :Notes => Notes,
    :created_at => c)

    column = Column.create!(:battery_id => battery.id,
                :Type => Type,
                :Floors => Floors,
                :Status => Status,
                :Information => Notes,
                :Notes => Notes)
             
                Elevator.create!(:column_id =>  column.id,
                    :Serial_number => Type,
                    :Model => Type,
                    :Type => Type,
                    :Status => Status,
                    :Start_date => c,
                    :Last_check => c,
                    :Certificate => Type,
                    :Information => Notes,
                    :Notes => Notes,
                    :created_at => c)

                        BuildingDetail.create!(:building_id =>  building.id,
                            :Information_Key => Type,
                            :Value => Type)
                                    Address.create!(:Address => AddressA,
                                        :Status => Status,
                                        :Entity => Status,
                                        :Street => Street,
                                        :Appartment => Secondary_Address,
                                        :City => City,
                                        :Zipcode => Status,
                                        :Country => Status,
                                        :Notes => Notes)
                                        
                                

                            
                
end