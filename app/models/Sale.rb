class Sale < ActiveRecord::Base
  attr_accessible :name, :photo, :description
  has_many :sale_orders
  has_attached_file :photo,
                    :styles => {
                        :thumb => ["50x50#", :png],
                        :for_main => ["186x186#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
end
