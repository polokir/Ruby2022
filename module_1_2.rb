require 'test-unit'

class Test_F<Test::Unit::TestCase



  def test_srch_brand
    item1=Product.new(90,"Nasha ryaba",1,"NPO",21,'03/01/2003',23)
    item2=Product.new(91,"Nasha ryaba",2,"BCK",100,'03/02/2003',909)
    item3=Product.new(92,"Nasha ryaba",3,"VolodarKa",63,'03/03/2003',87)
    item4=Product.new(93,"Sinkers",4,"NPO",12,'03/04/2003',560)
    item5=Product.new(94,"Nuts",5,"BCK",23,'03/05/2003',1200)
    item6=Product.new(95,"Bounty",6,"VolodarKa",11,'03/06/2003',874)

    products = [item1,item2,item3,item4,item5,item6]
    res1=[item1,item2,item3]
    assert_equal(res1,srch_by_brand(products))
  end

  def test_srch_brand_cos
    item1=Product.new(90,"Nasha ryaba",1,"NPO",21,'03/01/2003',23)
    item2=Product.new(91,"Nasha ryaba",2,"BCK",100,'03/02/2003',909)
    item3=Product.new(92,"Nasha ryaba",3,"VolodarKa",63,'03/03/2003',87)
    item4=Product.new(93,"Sinkers",4,"NPO",12,'03/04/2003',560)
    item5=Product.new(94,"Nuts",5,"BCK",23,'03/05/2003',1200)
    item6=Product.new(95,"Bounty",6,"VolodarKa",11,'03/06/2003',874)

    products = [item1,item2,item3,item4,item5,item6]
    res = [item1,item3]
    assert_equal(res,srch_brand_cost(products))
  end

  def test_srch_by_expr
    item1=Product.new(90,"Nasha ryaba",1,"NPO",21,'03/01/2003',23)
    item2=Product.new(91,"Nasha ryaba",2,"BCK",100,'03/02/2003',909)
    item3=Product.new(92,"Nasha ryaba",3,"VolodarKa",63,'03/03/2003',87)
    item4=Product.new(93,"Sinkers",4,"NPO",12,'03/04/2003',560)
    item5=Product.new(94,"Nuts",5,"BCK",23,'03/05/2003',1200)
    item6=Product.new(95,"Bounty",6,"VolodarKa",11,'03/06/2003',874)

    products = [item1,item2,item3,item4,item5,item6]
    res1=[item5,item6]
    assert_equal(res1,srch_expr(products))
  end
end

class Product

  def initialize(id, brand, upc, manufacturer, cost, exp_date,numb)
    @id = id
    @brand = brand
    @upc = upc
    @manufacturer = manufacturer
    @cost = cost
    @exp_date = exp_date;
    @numb=numb
  end

  attr_accessor :id, :brand, :upc, :manufacturer, :cost, :exp_date

  def to_s
    @id.to_s + "  " + @brand.to_s + "  " + @upc.to_s + "  " + @manufacturer.to_s + "  " + @cost.to_s + \
  "  " + @exp_date.to_s + "  " + @numb.to_s
  end
end

item1=Product.new(90,"Nasha ryaba",1,"NPO",21,'03/01/2003',23)
item2=Product.new(91,"Nasha ryaba",2,"BCK",100,'03/02/2003',909)
item3=Product.new(92,"Nasha ryaba",3,"VolodarKa",63,'03/03/2003',87)
item4=Product.new(93,"Sinkers",4,"NPO",12,'03/04/2003',560)
item5=Product.new(94,"Nuts",5,"BCK",23,'03/05/2003',1200)
item6=Product.new(95,"Bounty",6,"VolodarKa",11,'03/06/2003',874)

products = [item1,item2,item3,item4,item5,item6]


def srch_by_brand(products)
  brnd="Nasha ryaba" #gets.chomp.to_s
  goods=[]
  products.each {
    |item| if item.brand==brnd
             print(item.to_s)
             printf("\n")
             goods.append(item)
           end
  }
  return goods
end

def srch_brand_cost(products)
  printf("\n")
  print("Enter price")
  price= 90#gets.chomp.to_i
  brnd = "Nasha ryaba"
  printf("Searched by brand\n")
  print("\n")
  goods=[]
  products.each { |item| if item.cost<price && item.brand==brnd
                        print(item.to_s)
                        printf("\n")
                        goods.append(item)
                      end
  }
  printf("Searched by price\n")
  return goods
end

def srch_expr(products)
  date ="03/05/2002" #gets.chomp.to_s
  time = Time.new
  time.strftime("%d/%m/%Y")
  goods=[]
  products.each do |item| if item.exp_date>date
                            print(item)
                            printf("\n")
                            goods.append(item)
                            end
  end
  return goods
end


