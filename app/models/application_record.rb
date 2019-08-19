class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # writing and reading are the labels Rails assumes,
  # we are not using them as replicas but rather as full shards.
  connects_to database: { writing: :shard0, reading: :shard1 }
end
