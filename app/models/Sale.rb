class Sale < ActiveRecord::Base
  attr_accessible :name, :photo, :description
  has_attached_file :photo,
                    :styles => {
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
end
