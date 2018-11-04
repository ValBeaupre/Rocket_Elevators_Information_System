class ChartsController < ApplicationController
  
  layout "relevators"
  

  def contacts
    conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

    @contacts = conn.exec("select extract(month from \"CreationDate\") as \"Month\", extract(year from \"CreationDate\") as \"Year\", Count(*) as \"Number\" from public.\"FactContact\" group by 1,2 order by \"Year\", \"Month\" asc")
    puts @contacts.inspect
    
    @res = []
       @contacts.each do |res|
        puts res
          @res << [res["Month"],res["Year"],res["Number"]]
       end
    
    render "pages/contacts"
    conn.finish()
  end

  
  def quotes_chart
    conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

    @quotes = conn.exec("select extract(month from \"CreationDate\") as \"Month\", extract(year from \"CreationDate\") as \"Year\", Count(*) as \"Number\" from public.\"FactQuotes\" group by 1,2 order by \"Year\", \"Month\" asc")
    puts @quotes.inspect
    
    @res = []
       @quotes.each do |res|
        puts res
          @res << [res["Month"],res["Year"],res["Number"]]
       end
    
    render "charts/quotes_chart"
    conn.finish()
  end

  
  def elevators_per_client
    conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "martin", password: "martin123", dbname: "martin")

    @elevators = conn.exec("select extract(month from \"CreationDate\") as \"Month\", extract(year from \"CreationDate\") as \"Year\", Count(*) as \"Number\" from public.\"FactContact\" group by 1,2 order by \"Year\", \"Month\" asc")
    puts @elevators.inspect
    
    @res = []
       @elevators.each do |res|
        puts res
          @res << [res["Month"],res["Year"],res["Number"]]
       end
    
    render "pages/elevators_per_client"
    conn.finish()
  end

end
