class DataSaveService
  def self.save(buyer, buyerdata)
    buyer.save
    buyerdata.save
  end
end
