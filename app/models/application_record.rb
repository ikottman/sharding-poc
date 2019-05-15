class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :shard0, reading: :shard1 }
end
