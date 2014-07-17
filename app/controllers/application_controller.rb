class ApplicationController < ActionController::Base

  doc = Nokogiri::XML(open('/Users/jgaviria/Desktop/temp'))
  root = doc.root
  nodes = root.xpath("budget")
  nodes_counter =  nodes.count



  $total_gas  = 0
  $total_income = 0
  $total_all = 0
  $total_eatout = 0
  $total_groceries = 0
  $total_tolls = 0
  $total_clothes = 0
  $total_insurance = 0
  $total_cash = 0
  $total_cell = 0
  $total_credit = 0
  $total_misc = 0
  $counter_gas = 0

  $arraygas = []
  $arrayeatout = []
  $arrayincome = []
  $arrayall = []
  $arrayeatout = []
  $arraygroceries = []
  $arraytolls = []
  $arraygasdesc = []
  $arrayeatoutdesc = []
  $arraygroceriesdesc = []
  $arraymisc = []
  $datearray = []



  for x in 0..nodes_counter-1

    $all_nodes = nodes[x].at_xpath("Debit").text.to_i
    $date      = nodes[nodes_counter - 1].at_xpath("Date").text
    $date2     = nodes[0].at_xpath("Date").text
    $total_all = $total_all + $all_nodes


    if ((/shell Oil/)  =~ nodes[x].at_xpath("Description").text.downcase || (/shell service/)  =~ nodes[x].at_xpath("Description").text.downcase ||
        (/amoco/)  =~ nodes[x].at_xpath("Description").text.downcase || (/rally/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/bp/)  =~ nodes[x].at_xpath("Description").text.downcase || (/chevron/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/circle k/)  =~ nodes[x].at_xpath("Description").text.downcase || (/citgo/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/conoco/)  =~ nodes[x].at_xpath("Description").text.downcase || (/exxon/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/hess/)  =~ nodes[x].at_xpath("Description").text.downcase || (/marathon oil/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/cumberalnd farms/)  =~ nodes[x].at_xpath("Description").text.downcase || (/pilot/)  =~ nodes[x].at_xpath("Description").text.downcase     ||
        (/7-eleven/)  =~ nodes[x].at_xpath("Description").text.downcase || (/racetrac/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/texaco/)  =~ nodes[x].at_xpath("Description").text.downcase || (/sunoco/)  =~ nodes[x].at_xpath("Description").text.downcase)


      $a = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text
      $arraygasdesc << $descr
      $arraygas << $a
      $total_gas = $total_gas + $a
      $counter_gas = $counter_gas + 1



    elsif ((/subway/)  =~ nodes[x].at_xpath("Description").text.downcase || (/cheesesteak/)  =~ nodes[x].at_xpath("Description").text.downcase ||
        (/china taste/)  =~ nodes[x].at_xpath("Description").text.downcase || (/chick-fil-a/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/mcdonald/)  =~ nodes[x].at_xpath("Description").text.downcase || (/wung thai/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/buffalo wild wing/)  =~ nodes[x].at_xpath("Description").text.downcase || (/firehouse/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/starbucks/)  =~ nodes[x].at_xpath("Description").text.downcase || (/wendys/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/azteca/)  =~ nodes[x].at_xpath("Description").text.downcase || (/boston on the bc/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/dunkin donuts/)  =~ nodes[x].at_xpath("Description").text.downcase || (/blue martini/)  =~ nodes[x].at_xpath("Description").text.downcase     ||
        (/hooters/)  =~ nodes[x].at_xpath("Description").text.downcase || (/bahama/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/texaco/)  =~ nodes[x].at_xpath("Description").text.downcase || (/sunoco/)  =~ nodes[x].at_xpath("Description").text.downcase)


      $b = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text
      $arrayeatoutdesc << $descr
      $arrayeatout << $b
      $total_eatout = $total_eatout + $b
      $counter_gas = $counter_gas + 1



    elsif ((/winn dixie/)  =~ nodes[x].at_xpath("Description").text.downcase || (/publix/)  =~ nodes[x].at_xpath("Description").text.downcase ||
        (/walmart/)  =~ nodes[x].at_xpath("Description").text.downcase || (/target/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/sweetbay/)  =~ nodes[x].at_xpath("Description").text.downcase || (/walgreens/)  =~ nodes[x].at_xpath("Description").text.downcase)


      $c = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text
      $arraygroceriesdesc << $descr
      $arraygroceries << $c
      $total_groceries = $total_groceries + $c
      $counter_gas = $counter_gas + 1


    elsif ((/sunpass/)  =~ nodes[x].at_xpath("Description").text.downcase || (/sunpass operations/)  =~ nodes[x].at_xpath("Description").text.downcase)


      $d = nodes[x].at_xpath("Debit").text.to_i
      $descr3 = nodes[x].at_xpath("Description").text
      $arraytolls << $descr3
      $arraytolls << $d
      $total_tolls = $total_tolls + $d
      $counter_gas = $counter_gas + 1


    elsif ((/ross/)  =~ nodes[x].at_xpath("Description").text.downcase || (/payless/)  =~ nodes[x].at_xpath("Description").text.downcase ||
        (/macys/)  =~ nodes[x].at_xpath("Description").text.downcase || (/express/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $f = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text

      $total_clothes = $total_clothes + $f
      $counter_gas = $counter_gas + 1


    elsif ((/usaa/)  =~ nodes[x].at_xpath("Description").text.downcase || (/USAA/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $g = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text

      $total_insurance = $total_insurance + $g
      $counter_gas = $counter_gas + 1


    elsif ((/atm/)  =~ nodes[x].at_xpath("Description").text.downcase || (/withdrawal/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $h = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text

      $total_cash = $total_cash + $h
      $counter_gas = $counter_gas + 1


    elsif ((/t-mobile/)  =~ nodes[x].at_xpath("Description").text.downcase || (/recurring/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $i = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text

      $total_cell = $total_cell + $i
      $counter_gas = $counter_gas + 1

    elsif ((/credit card/)  =~ nodes[x].at_xpath("Description").text.downcase || (/transfer to credit card/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $j = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text

      $total_credit = $total_credit + $j
      $counter_gas = $counter_gas + 1


    elsif ((/paid check/)  =~ nodes[x].at_xpath("Description").text.downcase || (/memberfees/)  =~ nodes[x].at_xpath("Description").text.downcase ||
        (/transfer to loan/)  =~ nodes[x].at_xpath("Description").text.downcase || (/j e beach park/)  =~ nodes[x].at_xpath("Description").text.downcase||
        (/amc/)  =~ nodes[x].at_xpath("Description").text.downcase || (/dick/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/black rose/)  =~ nodes[x].at_xpath("Description").text.downcase || (/residence inn/)  =~ nodes[x].at_xpath("Description").text.downcase  ||
        (/boston on the b c/)  =~ nodes[x].at_xpath("Description").text.downcase || (/wendys/)  =~ nodes[x].at_xpath("Description").text.downcase)

      $k = nodes[x].at_xpath("Debit").text.to_i
      $descr = nodes[x].at_xpath("Description").text
      $arraymisc << $descr
      $arraymisc << $b
      $total_misc = $total_misc + $k
      $counter_gas = $counter_gas + 1



    else (/Deposit/) =~ nodes[x].at_xpath("Description").text.downcase

    $l = nodes[x].at_xpath("Credit").text.to_i
    $descr1 = nodes[x].at_xpath("Description").text
    $arrayincome << $descr1
    $arrayincome << $l
    $total_income = $total_income + $l





    end



  end

end