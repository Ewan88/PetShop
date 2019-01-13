require'pry'

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets << pet
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, pet_name)
  i = 0
  for pet in pet_shop[:pets]
    i += 1
    if pet[:name] == pet_name
      return pet
    elsif pet[:name] != pet_name && i == pet_shop[:pets].length
      return nil
    end
  end
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    shop[:pets].reject! { |pet| pet[:name] == name }
  end
  return find_pet_by_name(shop, name)
end

def add_pet_to_stock(shop, pet)
  before = shop[:pets].length
  shop[:pets].push(pet)
  if shop[:pets].length > before
    return shop[:pets].length
  end
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  return customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  return customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  if customer_cash(customer) >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet) == true
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(shop, pet[:price])
      add_pet_to_customer(customer, pet)
      increase_pets_sold(shop, 1)
    end
  end
end
