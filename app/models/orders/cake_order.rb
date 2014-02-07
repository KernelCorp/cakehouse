class CakeOrder < Order
  attr_accessible :stuff, :photo

  has_attached_file :photo,
                    :styles => {
                        :thumb => ["50x50#", :png]
                    },
                    :path => ':rails_root/public/system/images/:style/:filename',
                    :url => '/system/images/:style/:filename'
end