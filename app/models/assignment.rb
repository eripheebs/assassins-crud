class Assignment
  include DataMapper::Resource

  property :id, Serial
  property :assassin_id, Integer
  property :target_id, Integer
end
