class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :created_at, DateTime
  property :start_date, Date
  property :end_date, Date
  property :img_url, Text


  def rented?
    self.rented_by ? true : false
  end

  belongs_to :user
  has n, :requests, through: Resource
end
